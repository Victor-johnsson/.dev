-- nvim v0.8.0
return {
    "kdheepak/lazygit.nvim",
    cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
        { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    },
    config = function()
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
            f = {
                lg = { "<cmd>LazyGit<cr>", "LazyGit" }, -- create a binding with label
            },
        }, { prefix = "<leader>" })
    end
}
