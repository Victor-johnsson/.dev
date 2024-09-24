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
        wk.add({

            {
                "<leader>td",
                function()
                    vim.cmd("TodoTelescope")
                end,
                desc = "Find TODO:s"
            },
            {
                "<leader>tq",
                function()
                    vim.cmd("TodoQuickFix")
                end,
                desc = "TODO QuickFix"
            },
            {
                "[t",
                function()
                    require("todo-comments").jump_prev()
                end,
                desc = "Previous TODO"
            },
            {
                "]t",
                function()
                    require("todo-comments").jump_next()
                end,
                desc = "Next TODO"
            }
        })
    end


}

