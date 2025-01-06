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

    require("mason").setup()
    -- require("java").setup()
    require("mason-lspconfig").setup({

      ensure_installed = {
        "lua_ls",
        "omnisharp",
        "helm_ls",
        "gopls"
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
        omnisharp = function()
          local lspconfig = require("lspconfig")
          lspconfig.omnisharp.setup {
            capabilities = capabilities,
            handlers = {
              --
              ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
              ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
              ["textDocument/references"] = require('omnisharp_extended').references_handler,
              ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
            },
            cmd = { "dotnet", "/home/victor/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },

            settings = {
              FormattingOptions = {
                -- Enables support for reading code style, naming convention and analyzer
                -- settings from .editorconfig.
                EnableEditorConfigSupport = true,
                -- Specifies whether 'using' directives should be grouped and sorted during
                -- document formatting.
                OrganizeImports = true,
              },
              MsBuild = {
                -- If true, MSBuild project system will only load projects for files that
                -- were opened in the editor. This setting is useful for big C# codebases
                -- and allows for faster initialization of code navigation features only
                -- for projects that are relevant to code that is being edited. With this
                -- setting enabled OmniSharp may load fewer projects and may thus display
                -- incomplete reference lists for symbols.
                LoadProjectsOnDemand = false,
              },
              RoslynExtensionsOptions = {
                -- Enables support for roslyn analyzers, code fixes and rulesets.
                EnableAnalyzersSupport = true,
                -- Enables support for showing unimported types and unimported extension
                -- methods in completion lists. When committed, the appropriate using
                -- directive will be added at the top of the current file. This option can
                -- have a negative impact on initial completion responsiveness,
                -- particularly for the first few completion sessions after opening a
                -- solution.
                EnableImportCompletion = true,
                -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                -- true
                AnalyzeOpenDocumentsOnly = nil,
              },
              Sdk = {
                -- Specifies whether to include preview versions of the .NET SDK when
                -- determining which version to use for project loading.
                IncludePrereleases = true,
              },
            },

          }
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
