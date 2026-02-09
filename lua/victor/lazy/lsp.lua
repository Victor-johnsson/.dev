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
                "ts_ls"
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


                copilot = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        capabilities = capabilities,
                    })

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
                    })
                end,

                bufls = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.bufls.setup({
                        capabilities = capabilities,
                    })
                end,
                pyright = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.pyright.setup({
                        capabilities = capabilities,
                    })
                end,
                html = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.html.setup({
                        capabilities = capabilities,
                    })
                end,
                -- emmet_ls = function()
                --     local lspconfig = require("lspconfig")
                --     lspconfig.emmet_ls.setup({
                --         capabilities = capabilities,
                --     })
                -- end,
                vim.lsp.config("roslyn", {
                    settings = {
                        ["csharp|inlay_hints"] = {
                            csharp_enable_inlay_hints_for_implicit_object_creation = true,
                            csharp_enable_inlay_hints_for_implicit_variable_types = true,
                            dotnet_enable_inlay_hints_for_object_creation_parameters = true,
                            dotnet_enable_inlay_hints_for_parameter_hints = true
                        },
                        ["csharp|code_lens"] = {
                            dotnet_enable_references_code_lens = true,
                            dotnet_enable_tests_code_lens = true
                        },
                        ["csharp|background_analysis"] = {
                            dotnet_analyzer_diagnostics_scope = "fullSolution",
                            dotnet_compiler_diagnostics_scope = "fullSolution",

                        },
                        ["csharp|completion"] = {
                            dotnet_show_completion_items_from_unimported_namespaces = true
                        },
                        ["csharp|formatting"] = {
                            dotnet_organize_imports_on_format = true
                        },
                    },
                }),
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
                        completions = true,
                        hover = true,
                        validate = true
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
