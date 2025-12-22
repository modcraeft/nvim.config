-- ~/.config/nvim/lua/plugins/core.lua

return {
  -- Colorscheme
  {
    "modcraeft/modcraeft",
    dir = vim.fn.stdpath("config") .. "/colors/modcraeft",
    lazy = false,
    priority = 1000,   -- load first
  },

  -- Nvim-Tree
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    opts = {
      sort = { sorter = "case_sensitive" },
      view = { width = 30 },
      renderer = { group_empty = true },
      filters = { dotfiles = true },
    },
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = true,
      })
    end,
  },

  -- MC – Multiple cursors
  {
    "mg979/vim-visual-multi",
    branch = "master",
    event = "VeryLazy",
    keys = {
      { "<C-n>", "<Plug>(VM-Find-Under)",          mode = {"n", "x"}, desc = "MC: Add cursor under" },
      { "<C-n>", "<Plug>(VM-Find-Subword-Under)", mode = "v",       desc = "MC: Add cursor under (visual)" },
    },
  },


  -- smear-cursor
  {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    opts = {
      smear_between_buffers          = true,
      smear_between_neighbor_lines   = true,
      scroll_buffer_space            = true,
      legacy_computing_symbols_support = false,
      smear_insert_mode             = true,
      -- your personal taste tweaks
      stiffness             = 0.6,
      trailing_opacity      = 0.6,
      distance              = 60,
    },
  },

  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },

  -- plenary.nvim (required by parrot.nvim)
  { "nvim-lua/plenary.nvim", lazy = flase },

  -- fzf-lua (for fuzzy finding providers/models/context)
  { "ibhagwan/fzf-lua", lazy = false },




  -- Which-key
  { "folke/which-key.nvim", event = "VeryLazy", config = true },

  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = "",
        --section_separators = { left = "", right = "" },  -- Rounded
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
