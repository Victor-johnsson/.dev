return {

  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',
    version= "0.8.2",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

    },
    opts_extend = { "sources.default" }
  },



}
