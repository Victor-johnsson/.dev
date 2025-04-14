return {
  "neovim/nvim-lspconfig",

  run = "make install_jsregexp",
  dependencies = {
    'saghen/blink.cmp',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "L3MON4D3/LuaSnip",
    "ziglang/zig.vim",
    'towolf/vim-helm',
    "Hoffs/omnisharp-extended-lsp.nvim"
  },

  opts = {},
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("mason").setup {
        registries = {
            "github:Crashdummyy/mason-registry",
            "github:mason-org/mason-registry",
        },
    }
    require("mason-lspconfig").setup({

      ensure_installed = {
        "lua_ls",
        "helm_ls",
        "gopls",
        "zls"
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,

          }
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,

        zls = function()
          local lspconfig = require("lspconfig")
          lspconfig.zls.setup({
            capabilities = capabilities,
          })
        end,
        gopls = function()
          local lspconfig = require("lspconfig")
          lspconfig.gopls.setup({
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                },
                staticcheck = true,
                gofumpt = true,
              },
            },
          })
        end,

        helm_ls = function()
          local lspconfig = require("lspconfig")
          lspconfig.helm_ls.setup {
            capabilities = capabilities,
            valuesFiles = {

              mainValuesFile = "values.yaml",
              lintOverlayValuesFile = "values.lint.yaml",
              additionalValuesFilesGlobPattern = "values*.yaml"
            },
            yamlls = {
              enabled = true,
              path = "yaml-language-server"
            }
          }
        end,

        yamlls = function()
          local lspconfig = require("lspconfig")
          lspconfig.yamlls.setup {
          }
        end,
      },
    })
  end
}
