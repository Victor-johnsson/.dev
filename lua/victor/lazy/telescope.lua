return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.6",


    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-tree/nvim-web-devicons'
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        --
        -- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        -- vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
        -- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        --
        -- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        -- vim.keymap.set('n', '<leader>pws', function()
        --     local word = vim.fn.expand("<cword>")
        --     builtin.grep_string({ search = word })
        -- end)
        -- vim.keymap.set('n', '<leader>pWs', function()
        --     local word = vim.fn.expand("<cWORD>")
        --     builtin.grep_string({ search = word })
        -- end)
        -- vim.keymap.set('n', '<leader>ps', function()
        --     builtin.grep_string({ search = vim.fn.input("Grep > ") })
        -- end)
        local wk = require("which-key")
        -- As an example, we will create the following mappings:
        --  * <leader>ff find files
        --  * <leader>fr show recent files
        --  * <leader>fb Foobar
        -- we'll document:
        --  * <leader>fn new file
        --  * <leader>fe edit file
        -- and hide <leader>1

        wk.register({
            p = {
                name = "telescope",                                   -- optional group name
                f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
                s = { "<cmd>Telescope live_grep<cr>", "Live Grep" },  -- create a binding with label
                b = { "<cmd>Telescope buffers<cr>", "Buffers" },      -- create a binding with label
                h = { "<cmd>Telescope help_tags<cr>", "Help Tags" },  -- create a binding with label
                ws = { function()
                    local word = vim.fn.expand("<cword>")
                    builtin.grep_string({ search = word })
                end, "Search word" }, -- create a binding with label
                Ws = { function()
                    local word = vim.fn.expand("<cWORD>")
                    builtin.grep_string({ search = word })
                end, "Search WORD" }, -- create a binding with label
            },
        }, { prefix = "<leader>" })
    end
}
