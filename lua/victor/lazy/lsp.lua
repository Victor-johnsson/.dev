return {
  "neovim/nvim-lspconfig",

  run = "make install_jsregexp",
  dependencies = {
    'saghen/blink.cmp',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    "ziglang/zig.vim",
    'towolf/vim-helm',
    "Hoffs/omnisharp-extended-lsp.nvim"
  },

  opts = {},
  config = function()
    -- local cmp = require('cmp')
    -- local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    require("fidget").setup({})

    require("mason").setup()
    require("java").setup()


    require("mason-lspconfig").setup({

      ensure_installed = {
        "lua_ls",
        "omnisharp",
        "helm_ls",
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
        -- csharp_ls = function()
        --     local lspconfig = require("lspconfig")
        --     lspconfig.csharp_ls.setup {
        --         capabilities = capabilities,
        --         handlers = {
        --             --
        --             ["textDocument/definition"] = require('csharpls_extended').handler,
        --             ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
        --         },
        --         -- cmd = { csharp_ls },
        --     }
        -- end,
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
      -- ["sonarlint-language-server"] = function()
      --   local lspconfig = require("lspconfig")
      --   lspconfig.sonarlint.setup({
      --     capabilities = capabilities, -- Use the capabilities you defined above
      --     cmd = {
      --       'sonarlint-language-server',
      --       '--stdio',
      --       '-analyzers',
      --       vim.fn.expand("~/.local/share/nvim/mason/share/sonarlint-analyzers/sonarlintomnisharp.jar"),
      --     },
      --     filetypes = { "cs" },
      --     root_dir = function(fname)
      --       return require("lspconfig.util").root_pattern("*.sln")(fname) or
      --           require("lspconfig.util").path.dirname(fname)
      --     end,
      --
      --     single_file_support = true,
      --     settings = {
      --       sonarlint = {
      --         rules = {
      --           ["c_sharp"] = {
      --             enabled = true,
      --           },
      --         },
      --       },
      --     },
      --     on_attach = function(client, bufnr)
      --       -- Enable diagnostics
      --       vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      --         vim.lsp.diagnostic.on_publish_diagnostics, {
      --           underline = true,
      --           virtual_text = true,
      --           signs = true,
      --           update_in_insert = false,
      --         }
      --       )
      --     end,
      --   })
      -- end,
    })


    -- local cmp_select = { behavior = cmp.SelectBehavior.Select }

    -- cmp.setup({
    --   snippet = {
    --     expand = function(args)
    --       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --     end,
    --   },
    --   mapping = cmp.mapping.preset.insert({
    --     ['<>'] = cmp.mapping.select_prev_item(cmp_select),
    --     ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    --     ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    --     ["<C-Space>"] = cmp.mapping.complete(),
    --   }),
    --   sources = cmp.config.sources({
    --     { name = 'nvim_lsp' },
    --     { name = 'luasnip' }, -- For luasnip users.
    --   }, {
    --     { name = 'buffer' },
    --   })
    -- })
  end
}
