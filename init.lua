require("user.settings")
require("user.commands")
require("user.keymaps")
require("user.plugin")

require("catppuccin").setup({
	flavour = "mocha",
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = true,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
