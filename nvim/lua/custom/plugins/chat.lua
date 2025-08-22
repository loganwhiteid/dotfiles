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
      google = function()
        local f = assert(io.open(os.getenv("HOME") .. "/.chat/google", "r"))
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
      },
    },
    default = {
      model = "gpt-4.1",
    },
    title_model = "gpt-4.1-nano",
  },
}
