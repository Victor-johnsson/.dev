return {

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },

        vim.keymap.set("n", "<leader>td", function()
            vim.cmd("TodoTelescope")
        end),
        vim.keymap.set("n", "]t", function()
            require("todo-comments").jump_next()
        end, { desc = "Next todo comment" }),

        vim.keymap.set("n", "[t", function()
            require("todo-comments").jump_prev()
        end, { desc = "Previous todo comment" }),

        config = function()
            -- local wk = require("which-key")
            -- -- As an example, we will create the following mappings:
            -- --  * <leader>ff find files
            -- --  * <leader>fr show recent files
            -- --  * <leader>fb Foobar
            -- -- we'll document:
            -- --  * <leader>fn new file
            -- --  * <leader>fe edit file
            -- -- and hide <leader>1
            --
            -- wk.register({
            --     t = {
            --         name = "Todo", -- optional group name
            --         d = { function()
            --             vim.cmd("TodoTelescope")
            --         end, "Find TODO:s" }, -- create a binding with label
            --     },
            -- }, { prefix = "<leader>" })
        end


    }
}
