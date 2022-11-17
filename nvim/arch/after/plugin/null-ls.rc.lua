local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

local on_attach = function(client, bufnr)
  -- formatting
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.api.nvim_command [[augroup END]]
  end
end

null_ls.setup {
  on_attach = on_attach,
  sources = {
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.eslint_d,
  }
}
