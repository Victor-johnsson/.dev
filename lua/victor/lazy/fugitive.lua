return {

    "tpope/vim-fugitive",

    config = function()
        local wk = require("which-key")
        local mappings = {
            g = {
                name = "Git",
                s = { ":Git<CR>", "Git Status" },
                a = { ":Git add .<CR>", "Git Add" },
                c = { ":Git commit<CR>", "Git Commit" },
                p = { ":Git push<CR>", "Git Push" },
            },
        }

        wk.register(mappings, { prefix = "<leader>" })
    end


}
