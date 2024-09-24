return {
    "nvim-telescope/telescope.nvim",

    -- tag = "0.1.8",


    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-tree/nvim-web-devicons'
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        local wk = require("which-key")

        wk.add({

            { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find File" },
            { "<leader>ps", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
            { "<leader>pb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
            { "<leader>ph", "<cmd>Telescope help_tags<cr>",  desc = "Help Tags" },
            {
                "<leader>pws",
                function()
                    local word = vim.fn.expand("<cword>")
                    builtin.grep_string({ search = word })
                end,
                desc = "Search word"
            },

            {
                "<leader>pWs",
                function()
                    local word = vim.fn.expand("<cWORD>")
                    builtin.grep_string({ search = word })
                end,
                desc = "Search WORD"
            },
        })
    end
}
