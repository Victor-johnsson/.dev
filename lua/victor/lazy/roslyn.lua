return {
    "seblyng/roslyn.nvim",
    ft = "cs",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
        -- your configuration comes here; leave empty for default settings

        broad_search = true,
        vim.treesitter.language.register("c_sharp", "csharp"),
        vim.lsp.inlay_hint.enable()




    }

}
