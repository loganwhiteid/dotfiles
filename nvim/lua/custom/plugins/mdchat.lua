return {
  -- lazy = false,
  dir = "~/repos/mdchat.nvim",
  -- "loganwhiteid/mdchat.nvim",
  dependencies = {
    -- "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    -- your config, or leave empty for defaults
    -- (required even if empty to load plugin)
    root_dir = vim.fn.stdpath("data") .. "/mdchat",
    chat_dir = "/chats",
    system_dir = "/systems",
    models = {
      ["or_cl"] = {
        provider = "openrouter",
        model = "anthropic/claude-sonnet-4",
      },
      ["or_cl45"] = {
        provider = "openrouter",
        model = "anthropic/claude-sonnet-4.5",
      },
      ["or_haiku"] = {
        provider = "openrouter",
        model = "anthropic/claude-3.5-haiku",
      },
      ["gpt5"] = {
        provider = "openai",
        model = "gpt-5",
      },
      ["gpt5nano"] = {
        provider = "openai",
        model = "gpt-5-nano",
      },
      ["claude4"] = {
        provider = "anthropic",
        model = "claude-sonnet-4-20250514",
      },
      ["haiku"] = {
        provider = "anthropic",
        model = "claude-3-5-haiku-20241022",
      },
    },
    default = {
      model = "or_cl45",
      temp = 0.4,
      history = 4,
      reasoning = "low",
      system_message = [[You are a principal software engineer and best practices are very important. Your colleague will ask you various questions about their code and ask you to assist with some coding tasks. 
Answer concisely and when asked for code avoid unnecessary verbose explanation. Only provide usage and explanation when asked or when providing system design assistance.]],
    },
    title_model = "or_haiku",
    wrap = false,
    --- chat buffer keymaps
    keymap = {
      send_message = "<CR>", -- normal mode keybind in chat windows to send message
      delete_chat = "<C-d>", -- keymap to delete a chat or settings file (from telescope menu)
      stop_generation = "<C-c>",
    },
  },
  --- global keymaps
  keys = {
    -- { "<leader>cf", "<cmd>ChatFocus<cr>", desc = "focus" },
    { "<leader>cn", "<cmd>MdchatNew<cr>", desc = "Create new chat" },
    { "<leader>co", "<cmd>MdchatOpen<cr>", desc = "Open a saved chat" },
    { "<leader>cm", "<cmd>MdchatModel<cr>", desc = "Switch models" },
    { "<leader>cs", "<cmd>MdchatReplaceSettings<cr>", desc = "Switch models" },
  },
}
