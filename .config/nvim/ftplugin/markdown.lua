vim.api.nvim_create_user_command("NewNote", function()
	local filename = os.date("%Y%m%d%H%M") .. ".md"
	vim.cmd("edit " .. filename)
end, {})

vim.api.nvim_create_user_command("ReplyNote", function()
	local current = vim.fn.expand("%:t:r")
	if current == "" then
		vim.notify("No se puede determinar la nota actual.", vim.log.levels.WARN)
		return
	end

	local new_filename = os.date("%Y%m%d%H%M") .. ".md"
	vim.cmd("edit " .. new_filename)
	vim.api.nvim_buf_set_lines(0, 0, 0, false, { "Re: [[" .. current .. "]]", "" })
end, {})

vim.api.nvim_create_user_command("Backlinks", function()
	local target = vim.fn.expand("%:t:r")
	if target == "" then
		vim.notify("No se puede determinar la nota actual.", vim.log.levels.WARN)
	end

	local builtin = require("telescope.builtin")
	builtin.live_grep({
		default_text = string.format("\\[\\[%s\\]\\]", target),
		prompt_title = "Backlinks → " .. target,
		layout_config = {
			preview_width = 0.75,
			width = 0.95,
			height = 0.9,
		},
	})
end, {})


local function get_backlink_paragraphs(target)
	local pattern = string.format('"\\[\\[%s\\]\\]"', target)
	local cmd =  "rg --vimgrep --no-heading --color=never " .. pattern
	local results = vim.fn.systemlist(cmd)

	if vim.v.shell_error ~= 0 or #results == 0 then
		return nil
	end

	local backlinks = {}

	for _, line in ipairs(results) do
		local filename, lnum = line:match("([^:]+):(%d+):")

		if filename and lnum then
			lnum = tonumber(lnum)
			local lines = vim.fn.readfile(filename)
			local start, stop = lnum, lnum

			-- expandir hacia arriba hasta una línea vacía o inicio
			while start > 1 and lines[start - 1] ~= "" do
				start = start - 1
			end

			-- expandir hacia abajo hasta una línea vacía o final
			while stop < #lines and lines[stop + 1] ~= "" do
				stop = stop + 1
			end

			local paragraph = table.concat(vim.list_slice(lines, start, stop), "\n")
			local note_name = vim.fn.fnamemodify(filename, ":t:r")

			table.insert(backlinks, { note = note_name, paragraph = paragraph })
		end
	end

	return backlinks
end

function show_backlinks()
	target = vim.fn.expand("%:t:r") -- nombre de la nota actual

	local backlinks = get_backlink_paragraphs(target)

	if not backlinks then
		vim.notify("No backlinks found for [[" .. target .. "]]", vim.log.levels.INFO)
		return
	end

	-- Crear nuevo split vertical
	vim.cmd("rightbelow vnew")
	vim.cmd("vertical resize 60")
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "hide"
	vim.bo.swapfile = false
	vim.bo.filetype = "markdown"
	vim.bo.modifiable = true

	local lines = { "# Backlinks de " .. target, "" }

	for _, b in ipairs(backlinks) do
		table.insert(lines, "## [[" .. b.note .. "]]")
		table.insert(lines, "")
		vim.list_extend(lines, vim.split(b.paragraph, "\n"))
		table.insert(lines, "")
	end

	vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
	vim.bo.modifiable = false
	vim.bo.readonly = true

	vim.notify("Showing backlinks for [[" .. target .. "]]", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command("SuperBacklinks", show_backlinks, {})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  callback = function(args)
    local name = vim.fn.fnamemodify(args.file, ":t")
    if name:match("^%d%d%d%d%-%d%d%-%d%d%.md$") then
      vim.opt_local.breakindent = true
      vim.opt_local.breakindentopt = "shift:2"
    end
  end,
})

