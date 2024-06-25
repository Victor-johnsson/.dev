return {
    "nikitathomas342/lazyk9s.nvim",
    cmd = {
        "LazyK9s",
    },
    -- optional for floating window border decoration
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>lk", "<cmd>LazyK9s<cr>", desc = "LazyKubernetes" }
    }
}
