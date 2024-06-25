return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",


    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-tree/nvim-web-devicons'
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        local wk = require("which-key")

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
