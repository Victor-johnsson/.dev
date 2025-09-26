-- lazy.nvim
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        -- add any options here
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
        })

        -- 🔧 Patch for Roslyn / servers missing token in $/progress
        -- 🔧 Safe patch for Roslyn / servers sending invalid $/progress notifications
        -- local ok, progress = pcall(require, "noice.lsp.progress")
        -- if ok then
        --     local orig = progress.progress
        --     progress.progress = function(self, msg, ...)
        --         -- Guard against nil msg or nil token
        --         if not msg or not msg.token then
        --             return
        --         end
        --         return orig(self, msg, ...)
        --     end
        -- end
    end,
}
