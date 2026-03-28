return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    overrides = {
      buftype = {
        nofile = {
          enabled = false,
        },
      },
    },
    render_modes = true,
    -- preset = "lazy",
    heading = {
      border = false,
      border_virtual = true,
      position = "overlay",
      width = "block",
      min_width = 120,
      sign = false,
      -- render_modes = true,
    },
    code = {
      enabled = true,
      sign = false,
      -- render_modes = true,
      min_width = 80,
      width = "block",
      border = "thin",
      style = "language",
      -- left_margin = 5,
      left_pad = 2,
      right_pad = 2,
      language_pad = 1,
      language_border = "🬋",
      language_icon = false,
      language_name = false,
      below = "🬋",
      above = "🬋",
      -- highlight_info = "RenderMarkdownCodeInline",
      highlight_border = "RenderMarkdownCodeInline",
      -- highlight_language = "MarkdownLinkText",
      -- highlight = "RenderMarkdownCodeInline",
      -- conceal_delimiters = false,
    },
  },
}
