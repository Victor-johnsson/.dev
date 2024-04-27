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
        "Decodetalkers/csharpls-extended-lsp.nvim"
    },

    config = function()
        local cmp = require('cmp')
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
                "rust_analyzer",
                "csharp_ls",

            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                        keys = {

                            { "gd",          "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Get Definition" },
                            { "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Get References" },
                        }

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
                ["csharp_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.csharp_ls.setup {
                        capabilities = capabilities,
                        -- keys = {
                        --     { "gd",          "<cmd>lua require('omnisharp_extended').lsp_definition()<cr>",      desc = "Get Definition" },
                        --     { "<leader>D",   "<cmd>lua require('omnisharp_extended').lsp_type_definition()<cr>", desc = "Get Type Definition" },
                        --     { "<leader>vrr", "<cmd>lua require('omnisharp_extended').lsp_references()<cr>",      desc = "Get References" },
                        --     { "<leader>vri", "<cmd>lua require('omnisharp_extended').lsp_implementation()<cr>",  desc = "Get Implementation" },
                        -- }

                        handlers = {

                            ["textDocument/definition"] = require('csharpls_extended').handler,
                            ["textDocument/typeDefinition"] = require('csharpls_extended').handler,
                        }
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
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
