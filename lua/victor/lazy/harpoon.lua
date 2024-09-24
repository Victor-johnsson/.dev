return {

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },


        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()




            local wk = require("which-key")
            wk.add({

                { "<leader>a", function() harpoon:list():add() end,                         desc = "Add buffer to Harpoon" },
                { "<C-e>",     function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon Quick Menu" },
                { "<leader>1", function() harpoon:list():select(1) end,                     desc = "Select buffer 1" },
                { "<leader>2", function() harpoon:list():select(2) end,                     desc = "Select buffer 2" },
                { "<leader>3", function() harpoon:list():select(3) end,                     desc = "Select buffer 3" },
                { "<leader>4", function() harpoon:list():select(4) end,                     desc = "Select buffer 4" },
                { "<leader>5", function() harpoon:list():select(5) end,                     desc = "Select buffer 5" },
                { "<C-1>",     function() harpoon:list():replace_at(1) end,                 desc = "Replace buffer 1" },
                { "<C-2>",     function() harpoon:list():replace_at(2) end,                 desc = "Replace buffer 2" },
                { "<C-3>",     function() harpoon:list():replace_at(3) end,                 desc = "Replace buffer 3" },
                { "<C-4>",     function() harpoon:list():replace_at(4) end,                 desc = "Replace buffer 4" },
                { "<C-5>",     function() harpoon:list():replace_at(5) end,                 desc = "Replace buffer 5" },

            })
        end
    }

}
