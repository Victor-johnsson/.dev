return {
    dir = "/Users/victor/source/aspire-docs",
    name = "aspire-docs.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("aspire_docs").setup()
        require("telescope").load_extension("aspire_docs")
    end,
}
