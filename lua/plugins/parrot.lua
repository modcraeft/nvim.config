return {
  "frankroeder/parrot.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",  -- already added above, but safe to reference
    "ibhagwan/fzf-lua",
  },
  lazy = true,  -- load on commands/keymaps
  cmd = { "PrtChatNew", "PrtRewrite", "PrtAppend", "PrtPrepend" },  -- auto-install on these commands
  keys = {
    { "<leader>pc", ":PrtChatNew<CR>", desc = "Parrot: New Chat", mode = "n" },
    { "<leader>pr", ":PrtRewrite ", desc = "Parrot: Rewrite selection", mode = "v" },
  },
  opts = {
  debug = true,
    providers = {
      xai = {
        name = "xai",
        endpoint = "https://api.x.ai/v1/chat/completions",
        api_key = os.getenv("XAI_API_KEY"),
        -- Add a valid default model explicitly
        -- model = "grok-4-0709",  -- or "grok-4-fast-reasoning" for faster/cheaper
        model = "grok-4-fast-reasoning",
        params = {
          chat = { temperature = 0.8, top_p = 1 },
          command = { temperature = 0.8, top_p = 1 },
        },
        topic = {
          model = "grok-3-mini",
          params = { max_completion_tokens = 64 },
        },
        -- Update to current models from curl
        models = {
          "grok-4-0709",
          "grok-4-fast-reasoning",
          "grok-4-fast-non-reasoning",
          "grok-3",
          "grok-3-mini",
        },
      },
    },
    provider = "xai", 
    llm_prefix = "🦜: ",        -- Prefix for Grok's responses
    chat_user_prefix = "💻: ",   -- Prefix for your messages (the continuation marker)
    -- Optional: set default provider to Grok
    chat = {
      welcome_message = "Welcome to Grok in Neovim 🦜",
      split = "vsplit",
      direction = "vertical",
      position = "right",
      width = 80,
      win_opts = {
        split = "rightbelow",
        vertical = true,
      },

    },
  },
  config = function(_, opts)
    require("parrot").setup(opts)
  end,
}
