return {
    {
        'stevearc/conform.nvim',
        opts = {},


        config = function()
            local conform = require("conform")

            conform.setup({
                lua = { "stylua" },
                -- python = { "isort", "black" },
                cs = { "csharpier" },
                format_on_save = {


                    timeout_ms = 500,
                    lsp_fallback = true,
                }

            })
        end
    }
}
