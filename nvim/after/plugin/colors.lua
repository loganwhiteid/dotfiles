function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

end


local colorscheme = "catppuccin"

require(colorscheme).setup({
	flavour = "mocha",
    transparent_background = true,
	styles = {
		comments = { "italic"}
	},
	color_overrides = {
		mocha = {
			surface2 = "#81879C",  -- Comment color 
		}
	},
	highlight_overrides = {
		mocha = function(mocha)
			return {
				LineNr = {fg = mocha.surface2},
				CursorLineNr = {fg = mocha.peach },
			}
		end,
	},
	integrations = {
		cmp = true,
		telescope = true,
	}
})

local ctp_feline = require('catppuccin.groups.integrations.feline')

require("feline").setup({
    components = ctp_feline.get(),
})

ColorMyPencils(colorscheme)
