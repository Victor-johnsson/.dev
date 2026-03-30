return {
    "neovim/nvim-lspconfig",

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
        -- require('java').setup({})
        require("mason-lspconfig").setup({

            ensure_installed = {
                "lua_ls",
                "helm_ls",
                "gopls",
                "zls",
                "ts_ls",
                "ruff",
                "eslint"
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
                ts_ls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ts_ls.setup({
                        capabilities = capabilities,
                        on_attach = function(client)
                            client.server_capabilities.documentFormattingProvider = false
                        end,
                        settings = {
                            typescript = {
                                suggest = {
                                    completeFunctionCalls = true,
                                },
                                updateImportsOnFileMove = {
                                    enabled = "always",
                                },
                                inlayHints = {
                                    includeInlayParameterNameHints = "all",
                                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                    includeInlayFunctionParameterTypeHints = true,
                                    includeInlayVariableTypeHints = true,
                                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                                    includeInlayPropertyDeclarationTypeHints = true,
                                    includeInlayFunctionLikeReturnTypeHints = true,
                                    includeInlayEnumMemberValueHints = true,
                                },
                            },
                            javascript = {
                                suggest = {
                                    completeFunctionCalls = true,
                                },
                                updateImportsOnFileMove = {
                                    enabled = "always",
                                },
                                inlayHints = {
                                    includeInlayParameterNameHints = "all",
                                    includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                    includeInlayFunctionParameterTypeHints = true,
                                    includeInlayVariableTypeHints = true,
                                    includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                                    includeInlayPropertyDeclarationTypeHints = true,
                                    includeInlayFunctionLikeReturnTypeHints = true,
                                    includeInlayEnumMemberValueHints = true,
                                },
                            },
                        },
                    })
                end,

                bufls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.bufls.setup({
                        capabilities = capabilities,
                    })
                end,
                ruff = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.ruff.setup({
                        capabilities = capabilities,
                    })
                end,
                eslint = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.eslint.setup({
                        capabilities = capabilities,
                    })
                end,
                html = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.html.setup({
                        capabilities = capabilities,
                    })
                end,
                gopls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.gopls.setup({
                        capabilities = capabilities,
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
                            path = "yaml-language-server",
                        }
                    }
                end,

                bicep = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.bicep_lsp.setup {
                    }
                end,
                yamlls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.yamlls.setup {
                        capabilities = capabilities,
                        settings = {
                            yaml = {
                                completion = true,
                                hover = true,
                                validate = true,
                            },
                        },
                    }
                end,
                jdtls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.jdtls.setup {
                        capabilities = capabilities,
                    }
                end,
            },
        })
    end
}
