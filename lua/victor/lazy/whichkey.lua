return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require("which-key")

        wk.add({
            { "<leader>Y",  [["=]] },
            { "<leader>k",  "<cmd>lnext<CR>zz" },

            { "<leader>j",  "<cmd>lprev<CR>zz" },
            { "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Replace word in whole file", noremap = false },
            {
                "<leader>f",
                function()
                    require("conform").format({
                        async = true,
                        lsp_fallback = true

                    })
                end,
                desc = "Format document"
            },
            {
                "<D-i>",
                function()
                    vim.diagnostic.open_float({
                        border = "rounded",
                        -- source = "always",
                        header = "",
                        prefix = "",
                        scope = "cursor",


                    })
                end,
                desc = "Diagnostic open floating window"
            },
            { "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>",     desc = "Make It Rain" },
            { "<leader>gi",  function() vim.lsp.buf.implementation() end,   desc = "Goto Implementation" },


            { "<leader>gr",  function() vim.lsp.buf.references() end,       desc = "References " },
            { "<leader>gD",  function() vim.lsp.buf.type_definition() end,  desc = "Type definition" },
            { "K",           function() vim.lsp.buf.hover() end,            desc = "Hover signature" },
            { "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, desc = "Workspace symbols" },
            { "<leader>rn",  function() vim.lsp.buf.rename() end,           desc = "LSP Rename" },
            { "]d",          function() vim.diagnostic.get_next() end,      desc = "Next Diagnostic" },
            { "[d",          function() vim.diagnostic.get_prev() end,      desc = "Previous Diagnostic" },
            { "J",           "mzJ`z" },
            { "<D-u>",       "<C-u>zz" },
            { "<D-k>",       "<cmd>cnext<CR>zz",                            desc = "Next Item" },
            { "<D-j>",       "<cmd>cprev<CR>zz",                            desc = "Prev Item" },
            {
                mode = { "n", "v" },
                { "<leader>y", [["+y"]] },
                { "<leader>d", [["_d]] },

            },

            { mode = { "i" },      "<D-h>",      function() vim.lsp.buf.signature_help() end, desc = "Signature Help" },
            { mode = { "n", "v" }, "<leader>ca", function() vim.lsp.buf.code_action() end,    desc = "Code Action" },
            { mode = { "n", "v" }, "<leader>cl", function() vim.lsp.codelens.run() end,       desc = "codelens" },

            {
                mode = { "x" },
                { "<leader>p", [["_dP]] },
            },
            {
                mode = { "v" },
                { "<leader>J", ":m '>+1<CR>gv=gv" },
                { "<leader>K", ":m '<-2<CR>gv=gv" },
            },
        })
        wk.add({
            { "<leader>nat", function() require("neotest").run.run({ vim.fn.expand("%"), dotnet_additional_args = {} }) end, desc = "Run all tests" },
            { "<leader>nt",  function() require("neotest").run.run() end,                                                    desc = "Run tests" },
        })
    end

}
