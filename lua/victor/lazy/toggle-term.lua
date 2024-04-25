return {



    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({})

        vim.keymap.set("n", "<leader>tg", '<cmd>ToggleTerm<cr>', {})
        vim.keymap.set("n", "<leader>tg", '<cmd>ToggleTerm<cr>', {})
    end
}
