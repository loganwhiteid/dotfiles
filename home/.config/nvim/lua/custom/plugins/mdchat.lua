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
      ["or_cl46"] = {
        provider = "openrouter",
        model = "anthropic/claude-sonnet-4.6",
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
      ["g5chat"] = {
        provider = "openrouter",
        model = "openai/gpt-5-chat",
      },
      ["g5nano"] = {
        provider = "openrouter",
        model = "openai/gpt-5-nano",
      },
      ["g5codex"] = {
        provider = "openrouter",
        model = "openai/gpt-5-codex",
      },
      ["gemflash"] = {
        provider = "openrouter",
        model = "google/gemini-2.5-flash",
      },
      ["gempro"] = {
        provider = "openrouter",
        model = "google/gemini-2.5-pro",
      },
      ["grok41"] = {
        provider = "openrouter",
        model = "x-ai/grok-4.1-fast",
      },
    },
    default = {
      model = "or_cl46",
      temp = 0.4,
      history = 2,
      reasoning = "low",
      system_message = [[You are a principal software engineer and best practices are very important. Your colleague will ask you various questions about their code and ask you to assist with some coding tasks.
Don't praise the user or complement them. Output should be formated as markdown with headers starting at 4 number signs (####)
]],
    },
    title_model = "or_haiku",
    show_snapshot = true, -- Print snapshot of settings used at the end of Assistant header
    --- chat buffer keymaps
    keymap = {
      send_message = "<CR>", -- normal mode keybind in chat windows to send message
      delete_chat = "<C-d>", -- keymap to delete a chat or settings file (from telescope menu)
      stop_generation = "<C-c>",
    },
  },
  --- global keymaps
  keys = {
    { "<leader>cf", "<cmd>MdchatFocus<cr>", desc = "goto current chat buffer" },
    { "<leader>cn", "<cmd>MdchatNew<cr>", desc = "Create new chat" },
    { "<leader>co", "<cmd>MdchatOpen<cr>", desc = "Open a saved chat" },
    { "<leader>cm", "<cmd>MdchatModel<cr>", desc = "Switch models" },
    { "<leader>cs", "<cmd>MdchatReplaceSettings<cr>", desc = "Switch models" },
    { "<leader>cc", "<cmd>MdchatClone<cr>", desc = "Clone/Fork current chat" },
  },
}
