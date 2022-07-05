-- require("nvim-tree").setup({
--   update_cwd = true,
--   sort_by = "case_sensitive",
--   view = {
--     adaptive_size = true,
--     mappings = {
--       list = {
--         { key = "u", action = "dir_up" },
--         { key = {"<CR>", "o"}, action = "edit" },
--       },
--     },
--   },
--   renderer = {
--     group_empty = true,
--     indent_markers = {
--       enable = true,
--     },
--   },
--   filters = {
--     dotfiles = false, -- show hidden file
--   },
--   diagnostics = {
--     enable = true,
--   },
-- })


-- require("bufferline").setup{
-- options = {
--   model = "buffers",
--   numbers = "ordinal",
--   diagnostic = "nvim_lsp",
--   color_icons = true,
--   always_show_bufferline = true,
--   offsets = {
--     {
--         filetype = "NvimTree",
--         text = "NvimTree",
--         highlight = "Directory",
--         text_align = "left"
--     }
--     }
--   }
-- }
-- vim.cmd([[
-- highlight BufferLineFill guibg=#282828
-- ]])

--[[require("github-theme").setup({
  theme_style = "dark",
  function_style = "italic",
  sidebars = {"qf", "vista_kind", "terminal", "packer"},

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = {hint = "orange", error = "#ff0000"},

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = {fg = c.red, bg = "#282c34", sp = c.hint, style = "underline"},
      DiagnosticHint = {link = "LspDiagnosticsDefaultHint"},
      -- this will remove the highlight groups
      TSField = {},
    }
  end
})]]

-- easymotion
-- vim.cmd([[
-- nmap f <Plug>(easymotion-s)
-- ]])


-- vim-gitgutter
-- vim.g.gitgutter_sign_allow_clobber = 0
-- vim.g.gitgutter_set_sign_backgrounds = 1
-- vim.g.gitgutter_map_keys = 0
-- vim.g.gitgutter_preview_win_floating = 1
-- vim.g.gitgutter_sign_added = '▎'
-- vim.g.gitgutter_sign_modified = '░'
-- vim.g.gitgutter_sign_removed = '▎'
-- vim.g.gitgutter_sign_removed_first_line = '▔'
-- vim.g.gitgutter_sign_modified_removed = '▒'
-- vim.cmd([[
-- highlight GitGutterAdd    guifg=#8ec07c ctermfg=108
-- highlight GitGutterChange guifg=#fabd2f ctermfg=214
-- highlight GitGutterDelete guifg=#cc241d ctermfg=124
-- ]])

-- vim-markdown
-- vim.opt.conceallevel = 0
-- vim.g.vim_markdown_math = 1
-- vim.g.vim_markdown_frontmatter = 1
-- vim.g.vim_markdown_strikethrough = 1
-- vim.cmd([[
-- highlight htmlBold gui=bold guifg=#fe8019
-- highlight htmlItalic gui=bold guifg=#458588
-- highlight htmlLink guifg=#83a598 cterm=underline gui=underline
-- ]])

-- indent-blankline.nvim
-- require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    -- show_current_context = true, highlight the indent
    -- show_current_context_start = true,
-- }


-- nvim-telescope
-- vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true })
--[[
--nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
--]]

-- toggleterm

-- require("toggleterm").setup{
--   size = 20,
--   open_mapping = [[<c-\>]],
--   direction = 'float',
--   close_on_exit = true,
-- }
-- vim.cmd([[
-- function! Mterm() abort
--   :ToggleTerm direction=horizontal
-- endfunction
-- command! Mterm call Mterm()
-- ]])


-- treesitter
-- require('nvim-treesitter.configs').setup{
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false,
--   }
-- }

-- alpha.nvim
-- require('alpha').setup(require('alpha.themes.dashboard').config)

-- nvim-autopair
-- require("nvim-autopairs").setup {}

-- Ultisnips
-- vim.g.UltiSnipsJumpForwardTrigger = "<C-e>"
