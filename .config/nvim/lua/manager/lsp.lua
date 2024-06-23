-- Setup lspconfig.
require("manager.handlers").setup()

local function on_attach(client, bufnr)
	-- formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command([[augroup Format]])
		vim.api.nvim_command([[autocmd! * <buffer>]])
		vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
		vim.api.nvim_command([[augroup END]])
	end
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)

	-- set up for illuminate
	require("illuminate").on_attach(client)

	-- nvim-nvic
	if client.server_capabilities.documentFormattingProvider then
		require("nvim-navic").attach(client, bufnr)
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
			return
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		})
	end,
	settings = {
		Lua = {},
	},
})
-- require("lspconfig").tsserver.setup({
-- 	capabilities = capabilities,
-- })
require("lspconfig").vtsls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig").cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
require("lspconfig").astro.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
