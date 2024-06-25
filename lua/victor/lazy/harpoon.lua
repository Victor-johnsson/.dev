return {

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },


        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            -- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
            -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            -- vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
            -- vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
            -- vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
            -- vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<leader><C-1>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader><C-2>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader><C-3>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader><C-4>", function() harpoon:list():replace_at(4) end)



            local wk = require("which-key")
            wk.register({
                a = { function() harpoon:list():add() end, "Add buffer to Harpoon" },
                ["1"] = { function() harpoon:list():select(1) end, "Select buffer 1" },
                ["2"] = { function() harpoon:list():select(2) end, "Select buffer 2" },
                ["3"] = { function() harpoon:list():select(3) end, "Select buffer 3" },
                ["4"] = { function() harpoon:list():select(4) end, "Select buffer 4" },
                ["5"] = { function() harpoon:list():select(5) end, "Select buffer 5" },
                ["6"] = { function() harpoon:list():select(6) end, "Select buffer 6" },
                ["<C-e>"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Harpoon Quick Menu" },
                ["<C-1>"] = { function() harpoon:list():replace_at(1) end, "Replace buffer 1" },
                ["<C-2>"] = { function() harpoon:list():replace_at(2) end, "Replace buffer 2" },
                ["<C-3>"] = { function() harpoon:list():replace_at(3) end, "Replace buffer 3" },
                ["<C-4>"] = { function() harpoon:list():replace_at(4) end, "Replace buffer 4" },
                ["<C-5>"] = { function() harpoon:list():replace_at(5) end, "Replace buffer 5" },
                ["<C-6>"] = { function() harpoon:list():replace_at(6) end, "Replace buffer 6" },
            }, { prefix = "<leader>" })
            wk.register({
                ["<C-e>"] = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Harpoon Quick Menu" },
            }, {})
        end
    }

}
