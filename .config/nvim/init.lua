-- Neovim de Alan >:)

vim.opt.guicursor = ''
vim.g.mapleader = ' '
vim.opt.encoding = 'utf-8'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.smoothscroll = true
vim.opt.updatetime = 50
vim.opt.shortmess:append('c')
vim.opt.wildmenu = true
vim.opt.wildoptions = 'pum'
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.opt.scrolloff = 8
vim.opt.foldenable = false

vim.keymap.set('n', 'Q', '@q')
vim.keymap.set('n', '<leader>n', '<CMD>set relativenumber!<CR>')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-j>', '<CMD>bn<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', '<CMD>bp<CR>', { silent = true })
vim.keymap.set('n', '<leader>m', '<CMD>make<CR>')

vim.opt.spelllang = { 'es', 'en' }
vim.keymap.set('i', '<C-l>', '<c-g>u<Esc>[s1z=`]a<c-g>u')

require 'paq' {
	{ 'L3MON4D3/LuaSnip', version = '2.*', build = 'make install_jsregexp' },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	'miikanissi/modus-themes.nvim',
	'stevearc/oil.nvim',
    'lervag/vimtex',
	'lervag/wiki.vim',
	'ibhagwan/fzf-lua',
}

vim.cmd.colorscheme('modus')
vim.api.nvim_set_hl(0, "@function.latex", { link = "Label" })
vim.api.nvim_set_hl(0, "@markup.math.latex", { link = "Normal" })
vim.api.nvim_set_hl(0, "@punctuation.bracket.latex", { link = "Type" })

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'latex', 'markdown', 'tex', 'go', 'c', 'python' },
	callback = function() vim.treesitter.start() end,
})

local ls = require('luasnip')
vim.keymap.set({'i'}, '<Tab>', function() ls.expand() end, {silent = true})
vim.keymap.set({'i', 's'}, '<Tab>', function() ls.jump(1) end, {silent = true})
vim.keymap.set({'i', 's'}, '<S-Tab>', function() ls.jump(-1) end, {silent = true})
vim.keymap.set({'i', 's'}, '<C-E>', function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})
ls.config.setup({ enable_autosnippets = true })
local ld = require('luasnip.loaders.from_lua')
ld.lazy_load({ paths = { '~/.config/nvim/snippets/' } })

vim.g.wiki_index_name = 'Home'
vim.g.wiki_root = '~/omnia/areae/codex'
vim.g.wiki_journal = {
	name = '',
	root = ''
}

require('fzf-lua')
vim.keymap.set('n', '<Leader><Leader>', function() FzfLua.files() end)
vim.keymap.set('n', '<Leader>g', function() FzfLua.live_grep() end)
vim.keymap.set('n', '<Leader>wf', function() FzfLua.files({ cwd = vim.g.wiki_root }) end)
vim.keymap.set('n', '<Leader>wg', function() FzfLua.live_grep({ cwd = vim.g.wiki_root }) end)

require('oil').setup()
vim.keymap.set('n', '<leader>f', '<CMD>Oil<CR>')
