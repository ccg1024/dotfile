return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      -- for plugin update notify
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "# Plugin Updates",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 2000,
    },
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "solarized_dark",
      },
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- animation
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- website
  -- https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=crazycodegame
  --   {
  --     "nvimdev/dashboard-nvim",
  --     event = "VimEnter",
  --     opts = function(_, opts)
  --       local logo = [[
  --  ██████╗██████╗  █████╗ ███████╗██╗   ██╗ ██████╗ ██████╗ ██████╗ ███████╗ ██████╗  █████╗ ███╗   ███╗███████╗
  -- ██╔════╝██╔══██╗██╔══██╗╚══███╔╝╚██╗ ██╔╝██╔════╝██╔═══██╗██╔══██╗██╔════╝██╔════╝ ██╔══██╗████╗ ████║██╔════╝
  -- ██║     ██████╔╝███████║  ███╔╝  ╚████╔╝ ██║     ██║   ██║██║  ██║█████╗  ██║  ███╗███████║██╔████╔██║█████╗
  -- ██║     ██╔══██╗██╔══██║ ███╔╝    ╚██╔╝  ██║     ██║   ██║██║  ██║██╔══╝  ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝
  -- ╚██████╗██║  ██║██║  ██║███████╗   ██║   ╚██████╗╚██████╔╝██████╔╝███████╗╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗
  --  ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝
  --
  --       ]]
  --       logo = string.rep("\n", 8) .. logo .. "\n\n"
  --       opts.config.header = vim.split(logo, "\n")
  --     end,
  --   },
}
