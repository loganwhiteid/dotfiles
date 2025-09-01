return {
  "e-cal/chat.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim", -- Default finder (can be replaced with junegunn/fzf.vim)
  },
  opts = {
    -- your config, or leave empty for defaults
    -- (required even if empty to load plugin)
    dir = vim.fn.stdpath("data") .. "/chat-nvim",
    api_keys = {
      openai = function()
        local f = assert(io.open(os.getenv("HOME") .. "/.chat/openai", "r"))
        local api_key = string.gsub(f:read("*all"), "\n", "")
        f:close()
        return api_key
      end,
      anthropic = function()
        local f = assert(io.open(os.getenv("HOME") .. "/.chat/claude", "r"))
        local api_key = string.gsub(f:read("*all"), "\n", "")
        f:close()
        return api_key
      end,
      openrouter = function()
        local f = assert(io.open(os.getenv("HOME") .. "/.chat/openrouter", "r"))
        local api_key = string.gsub(f:read("*all"), "\n", "")
        f:close()
        return api_key
      end,
    },
    model_maps = {
      openai = {
        ["gpt5"] = "gpt-5",
        ["gpt5nano"] = "gpt-5-nano",
      },
      anthropic = {
        ["claude4"] = "claude-sonnet-4-20250514",
        ["haiku"] = "claude-3-5-haiku-20241022",
      },
      openrouter = {
        ["or_cl4"] = "anthropic/claude-sonnet-4",
        ["or_haiku"] = "anthropic/claude-3.5-haiku",
        ["or_grok_code"] = "x-ai/grok-code-fast-1",
        ["or_grok4"] = "x-ai/grok-4",
        ["or_gpt5"] = "openai/gpt-5",
        ["or_gpt5nano"] = "openai/gpt-5-nano",
        ["or_gpt5mini"] = "openai/gpt-5-mini",
        ["or_geminipro"] = "google/gemini-2.5-pro",
        ["or_geminiflash"] = "google/gemini-2.5-flash",
      },
    },
    default = {
      model = "or_cl4",
      temp = 0.4,
      system_message = [[You are a senior software engineer and best practices are very important. Your colleague will ask you various questions about their code and ask you to assist with some coding tasks. 
Answer concisely and when asked for code avoid unnecessary verbose explanation. Only provide usage and explanation when asked.]],
    },
    title_model = "or_haiku",
  },
  keys = {
    { "<leader>cf", "<cmd>ChatFocus<cr>", desc = "focus" },
    { "<leader>cn", "<cmd>ChatNew<cr>", desc = "new chat" },
    { "<leader>co", "<cmd>ChatOpen<cr>", desc = "open chat" },
  },
}
