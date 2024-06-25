return {
    "mgierada/lazydocker.nvim",
    dependencies = { "akinsho/toggleterm.nvim" },
    config = function() require("lazydocker").setup {} end,
    event = "BufRead", -- or any other event you might want to use.
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>ld", "<cmd>Lazydocker<cr>", desc = "LazyDocker" }
    }
}
