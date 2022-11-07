local catppuccin = require("catppuccin")

-- configure it
catppuccin.setup({
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.15,
  },
  transparent_background = false,
  term_colors = true,
  compile = {
    enabled = false,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
    suffix = "_compiled"
  },
  styles = {
    comments = { "bold", "italic" },
    conditionals = {"bold", "italic"},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    coc_nvim = false,
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = true,
      transparent_panel = false,
    },
    dap = {
      enabled = false,
      enable_ui = false,
    },
    which_key = false,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = true,
    notify = true,
    telekasten = true,
    symbols_outline = true,
    mini = false,
  }
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
-- for illuminate plugin
vim.api.nvim_command [[ hi LspReferenceText cterm=underline gui=underline ]]
vim.api.nvim_command [[ hi LspReferenceWrite cterm=underline gui=underline ]]
vim.api.nvim_command [[ hi LspReferenceRead cterm=underline gui=underline ]]

-- transparent
-- vim.cmd('hi Normal guibg=NONE')
