-- vim.g.symbols_outline = 
require('symbols-outline').setup({
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    relative_width = true,
    width = 30,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "", hl = "TSType"},
        Method = {icon = "", hl = "TSMethod"},
        Property = {icon = "", hl = "TSMethod"},
        Field = {icon = "", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "練", hl = "TSType"},
        Interface = {icon = "練", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "", hl = "TSString"},
        Number = {icon = "", hl = "TSNumber"},
        Boolean = {icon = "◩", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "", hl = "TSType"},
        Key = {icon = "", hl = "TSType"},
        Null = {icon = "ﳠ", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = "", hl = "TSType"},
        Event = {icon = "", hl = "TSType"},
        Operator = {icon = "", hl = "TSOperator"},
        TypeParameter = {icon = "", hl = "TSParameter"}
    }
})

vim.api.nvim_set_keymap("n", "<leader>v", ":SymbolsOutline<CR>", { noremap = true, silent = true })

