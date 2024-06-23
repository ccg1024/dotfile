-- for snippets
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").filetype_extend("ruby", { "rails" })

require("mini.pairs").setup()

require("mini.surround").setup({
	mappings = {
		add = "<leader>ys",
		delete = "<leader>ds",
		replace = "<leader>cs",
		find = "<leader>sf",
		find_left = "<leader>sF",
		highlight = "<leader>sh",
		update_n_lines = "<leader>sn",
	},
})

local cmp = require("cmp")

if cmp ~= nil then
	cmp.setup.cmdline(":", {
		completion = { autocomplete = false },
		sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
	})
end
