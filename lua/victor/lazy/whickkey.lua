return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    },
    config = function()
        local wk = require("which-key")

        vim.keymap.set('n', '<leader><leader>', "<cmd>WhichKey<cr>", {})
        wk.register({
            f = {
                f = { "<leader><leader>", "Which Key" }, -- create a binding with label
            },
        }, {})
    end

}
