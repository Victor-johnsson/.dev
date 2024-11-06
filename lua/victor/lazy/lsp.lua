return {
    "neovim/nvim-lspconfig",
    dependencies = {
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
        -- "Decodetalkers/csharpls-extended-lsp.nvim",
        'towolf/vim-helm',
        "Hoffs/omnisharp-extended-lsp.nvim"
    },

    config = function()
        local cmp = require('cmp')
        -- require('helm').setup({})
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("java").setup()
        require("mason-lspconfig").setup({

            ensure_installed = {
                "lua_ls",
                "omnisharp",
                -- "csharp_ls",
                -- "ts_ls",
                "helm_ls",
                -- "csharpls_extended",
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
                        enable_import_completion = true,
                        organize_imports_on_format = true,
                        enable_roslyn_analyzers = true,
                        handlers = {
                            --
                            ["textDocument/definition"] = require('omnisharp_extended').definition_handler,
                            ["textDocument/typeDefinition"] = require('omnisharp_extended').type_definition_handler,
                            ["textDocument/references"] = require('omnisharp_extended').references_handler,
                            ["textDocument/implementation"] = require('omnisharp_extended').implementation_handler,
                        },
                        cmd = { "dotnet", "/home/victor/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll" },
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
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
                { name = 'path' }
            }, {
                { name = 'buffer' },
            })
        })
    end
}
