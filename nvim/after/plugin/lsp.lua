local lsp = require('lsp-zero').preset({
  name = 'recommended',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.ensure_installed({
  'tsserver',
  'eslint',
--  'sumneko_lua',
  'rust_analyzer',
})
local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-y>'] = cmp.mapping.confirm({ select = true}),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    preselect = 'none',
    completion = {
        completeopt = 'menuone,noinsert,noselect,preview'
    },
})
lsp.setup()

