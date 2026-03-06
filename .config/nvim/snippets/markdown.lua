local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

local function in_mathzone()
	local node = vim.treesitter.get_node()
	while node do
		local t = node:type()
		if t == "inline_formula" or t == "displayed_equation" or
			t == "multline_environment" or t == "inline" then
			return true
		end
		node = node:parent()
	end
	return false
end

return {}, {
	-- Markdown specific
	s("dm", { t({ "$$", "    " }), i(1), t({ "", "$$" }), i(0), }),
	s({ trig = "ali", priority = 500 } , { t({ "$$", "\\begin{align*}", "    " }), i(1), t({ "", "\\end{align*}", "$$" }), i(0), }),
	s("mk", { t("$"), i(1), t("$"), i(0), }),
	s("dv", { t({ "\\frac{d " }), i(1), t({ "}{d " }), i(2), t("} "), i(0) }, { condition = in_mathzone }),
	s("ee", { t({ "e^{" }), i(1), t({ "} " }), i(0) }, { condition = in_mathzone }),
	s("OO", { t("\\varnothing ") }, { condition = in_mathzone }),
	s("ZZ", { t("\\mathbb{Z} ") }, { condition = in_mathzone }),
	s("QQ", { t("\\mathbb{Q} ") }, { condition = in_mathzone }),
	s("RR", { t("\\mathbb{R} ") }, { condition = in_mathzone }),
	s("Rn", { t("\\mathbb{R}^n ") }, { condition = in_mathzone }),
	s("CC", { t("\\mathbb{C} ") }, { condition = in_mathzone }),
	s("Cn", { t("\\mathbb{C}^n ") }, { condition = in_mathzone }),
	s("HH", { t("\\mathbb{H} ") }, { condition = in_mathzone }),
	s("DD", { t("\\mathcal{D} ") }, { condition = in_mathzone }),

	-- Common 
	s("one", { t("1") }, { condition = in_mathzone }),
	s("two", { t("2") }, { condition = in_mathzone }),
	s("three", { t("3") }, { condition = in_mathzone }),
	s("four", { t("4") }, { condition = in_mathzone }),
	s("five", { t("5") }, { condition = in_mathzone }),
	s("six", { t("6") }, { condition = in_mathzone }),
	s("seven", { t("7") }, { condition = in_mathzone }),
	s("eight", { t("8") }, { condition = in_mathzone }),
	s("eleven", { t("9") }, { condition = in_mathzone }),
	s("zero", { t("0") }, { condition = in_mathzone }),
	s("oo", { t("\\infty ") }, { condition = in_mathzone }),
	s("inf", { t("\\infty ") }, { condition = in_mathzone }),

	s("pi", { t("\\pi") }, { condition = in_mathzone }),
	s("ga", { t("\\alpha") }, { condition = in_mathzone }),
	s("gb", { t("\\beta") }, { condition = in_mathzone }),
	s("gg", { t("\\gamma") }, { condition = in_mathzone }),
	s("gd", { t("\\delta") }, { condition = in_mathzone }),
	s("ge", { t("\\epsilon") }, { condition = in_mathzone }),
	s("gve", { t("\\varepsilon") }, { condition = in_mathzone }),
	s("gf", { t("\\phi") }, { condition = in_mathzone }),
	s("gvf", { t("\\varphi") }, { condition = in_mathzone }),
	s("gh", { t("\\theta") }, { condition = in_mathzone }),
	s("gk", { t("\\kappa") }, { condition = in_mathzone }),
	s("gq", { t("\\psi") }, { condition = in_mathzone }),
	s("gy", { t("\\eta") }, { condition = in_mathzone }),
	s("gm", { t("\\mu") }, { condition = in_mathzone }),
	s("gl", { t("\\lambda") }, { condition = in_mathzone }),
	s("gn", { t("\\nu") }, { condition = in_mathzone }),
	s("gr", { t("\\rho") }, { condition = in_mathzone }),
	s("gp", { t("\\pi") }, { condition = in_mathzone }),
	s("gs", { t("\\sigma") }, { condition = in_mathzone }),
	s("gu", { t("\\upsilon") }, { condition = in_mathzone }),
	s("gt", { t("\\tau") }, { condition = in_mathzone }),
	s("gx", { t("\\xi") }, { condition = in_mathzone }),
	s("gc", { t("\\chi") }, { condition = in_mathzone }),
	s("go", { t("\\omnicron") }, { condition = in_mathzone }),
	s("gw", { t("\\omega") }, { condition = in_mathzone }),
	s("gz", { t("\\zeta") }, { condition = in_mathzone }),

	s("gG", { t("\\Gamma") }, { condition = in_mathzone }),
	s("gD", { t("\\Delta") }, { condition = in_mathzone }),
	s("gF", { t("\\Phi") }, { condition = in_mathzone }),
	s("gH", { t("\\Theta") }, { condition = in_mathzone }),
	s("gQ", { t("\\Psi") }, { condition = in_mathzone }),
	s("gS", { t("\\Sigma") }, { condition = in_mathzone }),
	s("gW", { t("\\Omega") }, { condition = in_mathzone }),
	s("gL", { t("\\Lambda") }, { condition = in_mathzone }),

	s("eq", { t("= ") }, { condition = in_mathzone }),
	s("def", { t("\\equiv ") }, { condition = in_mathzone }),
	s("iso", { t("\\cong ") }, { condition = in_mathzone }),
	s("add", { t("+ ") }, { condition = in_mathzone }),
	s("plus", { t("+ ") }, { condition = in_mathzone }),
	s("min", { t("- ") }, { condition = in_mathzone }),
	s("ast", { t("* ") }, { condition = in_mathzone }),
	s("xx", { t("\\times ") }, { condition = in_mathzone }),
	s("VV", { t("\\wedge ") }, { condition = in_mathzone }),

	s("ox", { t("\\otimes ") }, { condition = in_mathzone }),
	s("op", { t("\\oplus ") }, { condition = in_mathzone }),
	s("OX", { t("\\bigotimes ") }, { condition = in_mathzone }),
	s("OP", { t("\\bigoplus ") }, { condition = in_mathzone }),

	s("...", { t("\\dots") }, { condition = in_mathzone }),
	s("cdot", { t("\\cdot") }, { condition = in_mathzone }),
	s("vdots", { t("\\vdots") }, { condition = in_mathzone }),
	s("ddots", { t("\\ddots") }, { condition = in_mathzone }),

	s("nl", { t("\\\\"), t("\t") }, { condition = in_mathzone }),
	s("ali", { t("&") }, { condition = in_mathzone }),
	s("ale", { t("&=") }, { condition = in_mathzone }),

	s("mto", { t("\\mapsto ") }, { condition = in_mathzone }),
	s("to", { t("\\to ") }, { condition = in_mathzone }),

	s("int", { t("\\int") }, { condition = in_mathzone }),
	s("sum", { t("\\sum") }, { condition = in_mathzone }),
	s("prod", { t("\\prod") }, { condition = in_mathzone }),
	s("det", { t("\\det ") }, { condition = in_mathzone }),
	s("dim", { t("\\dim ") }, { condition = in_mathzone }),

	s("arcsin", { t("\\arcsin ") }, { condition = in_mathzone }),
	s("arccos", { t("\\arccos ") }, { condition = in_mathzone }),
	s("arctan", { t("\\arctan ") }, { condition = in_mathzone }),
	s("sin", { t("\\sin ") }, { condition = in_mathzone }),
	s("cos", { t("\\cos ") }, { condition = in_mathzone }),
	s("tan", { t("\\tan ") }, { condition = in_mathzone }),
	s("csc", { t("\\csc ") }, { condition = in_mathzone }),
	s("sec", { t("\\sec ") }, { condition = in_mathzone }),
	s("cot", { t("\\cot ") }, { condition = in_mathzone }),
	s("exp", { t("\\exp ") }, { condition = in_mathzone }),

	s("uu", { t("\\cup ") }, { condition = in_mathzone }),
	s("nn", { t("\\cap ") }, { condition = in_mathzone }),
	s("cc", { t("\\subset ") }, { condition = in_mathzone }),
	s("UU", { t("\\bigcup ") }, { condition = in_mathzone }),
	s("NN", { t("\\bigcap ") }, { condition = in_mathzone }),

	s("pp", { t("\\partial") }, { condition = in_mathzone }),
	s("vv", { t("\\delta ") }, { condition = in_mathzone }),
	s("nab", { t("\\nabla ") }, { condition = in_mathzone }),
	s("div", { t("\\nabla \\cdot ") }, { condition = in_mathzone }),
	s("curl", { t("\\nabla \\times ") }, { condition = in_mathzone }),
	s("hh", { t("\\hbar") }, { condition = in_mathzone }),
	s("LL", { t("\\mathcal{L}") }, { condition = in_mathzone }),
	s("env", {
		t("\\begin{"), i(1), t({"}",
		"\t"}), i(0),
		t({"", "\\end{"}), rep(1), t("}")
	}, { condition = in_mathzone }),

	s("frac", { t("\\frac{"), i(1), t("}{"), i(2), t("} "), i(0) }, { condition = in_mathzone }),
	s("map", { i(1), t(": "), i(2), t(" \\to "), i(0) }, { condition = in_mathzone }),
	s("pdv", { t({ "\\frac{\\partial " }), i(1), t({ "}{\\partial " }), i(2), t("} "), i(0) }, { condition = in_mathzone }),
	s("vdv", { t({ "\\frac{\\delta " }), i(1), t({ "}{\\delta " }), i(2), t("} "), i(0) }, { condition = in_mathzone }),
	s("pa", { t({ "(" }), i(1), t({ ") " }), i(0) }, { condition = in_mathzone }),
	s("ssb", { t({ "[" }), i(1), t({ "] " }), i(0) }, { condition = in_mathzone }),
	s("scb", { t({ "\\{" }), i(1), t({ "\\} " }), i(0) }, { condition = in_mathzone }),
	s("set", { t({ "\\{" }), i(1), t({ "\\} " }), i(0) }, { condition = in_mathzone }),
	s("bpa", { t("\\left( "), i(1), t(" \\right) "), i(0) }, { condition = in_mathzone }),
	s("bsb", { t({ "\\left[ " }), i(1), t({ " \\right] " }), i(0) }, { condition = in_mathzone }),
	s("bcb", { t({ "\\left\\{ " }), i(1), t({ " \\right\\} " }), i(0) }, { condition = in_mathzone }),
	s("rt", { t({ "\\sqrt{" }), i(1), t({ "} " }), i(0) }, { condition = in_mathzone }),
	s("oname", { t({ "\\operatorname{" }), i(1), t({ "} " }), i(0) }, { condition = in_mathzone }),
	s("rm", { t({ "\\mathrm{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("bb", { t({ "\\mathbb{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("bf", { t({ "\\mathbf{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("cal", { t({ "\\mathcal{" }), i(1), t({ "}"  }), i(0) }, { condition = in_mathzone }),
	s("scr", { t({ "\\mathscr{" }), i(1), t({ "}"  }), i(0) }, { condition = in_mathzone }),
	s("frak", { t({ "\\mathfrak{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("vec", { t({ "\\vec{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("hat", { t({ "\\widehat{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("bar", { t({ "\\overline{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("til", { t({ "\\widetilde{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("bold", { t({ "\\bold{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("bra", { t({ "\\bra{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("ket", { t({ "\\ket{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s("bk", { t("\\braket{"), i(1), t("|"), i(2), t("}"), i(0) }, { condition = in_mathzone }),
	s("\"\"", { t({ "\\text{" }), i(1), t({ "}" }), i(0) }, { condition = in_mathzone }),
	s(
		{ trig = "pw", wordTrig = false },
		{ t("^{"), i(1), t("}"), i(0) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "sb", wordTrig = false },
		{ t("_{"), i(1), t("}"), i(0) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "of", wordTrig = false },
		{ t("("), i(1), t(")"), i(0) },
		{ condition = in_mathzone }
	),
	s(
		{ trig = "inv", wordTrig = false },
		{ t("^{-1}") },
		{ condition = in_mathzone }
	),
	s("arrowu", { t("\\arrow[u, \""), i(1), t("\"] "), i(0) }, { condition = in_mathzone }),
	s("arrowd", { t("\\arrow[d, \""), i(1), t("\"] "), i(0) }, { condition = in_mathzone }),
	s("arrowl", { t("\\arrow[l, \""), i(1), t("\"] "), i(0) }, { condition = in_mathzone }),
	s("arrowr", { t("\\arrow[right, \""), i(1), t("\"] "), i(0) }, { condition = in_mathzone }),
	s("arrown", { t("\\arrow["), i(1), t("] "), i(0) }, { condition = in_mathzone }),

}

