return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },


    config = function()
        require("todo-comments").setup()
        local wk = require("which-key")
        wk.register({
            t = {
                d = { function()
                    vim.cmd("TodoTelescope")
                end, "Find TODO:s" }, -- create a binding with label
                q = {

                    function()
                        vim.cmd("TodoQuickFix")
                    end,
                    "Todo QuickFix"
                }
            },
        }, { prefix = "<leader>" })
        wk.register({
            ["[t"] = { function()
                require("todo-comments").jump_prev()
            end, "Previous TODO" }, -- create a binding with label
            ["]t"] = { function()
                require("todo-comments").jump_next()
            end, "Next TODO" }, -- create a binding with label
        }, {})
    end


}