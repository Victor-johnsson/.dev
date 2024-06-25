return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require("which-key")



        wk.register({

            Y = { [["=Y"]] },
            k = { "<cmd>lnext<CR>zz" },
            j = { "<cmd>lprev<CR>zz" },
            s = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Replace word in whole file", noremap = false },
            f = { vim.lsp.buf.format, "Format document" },
            m = {

                r = { "<cmd>CellularAutomaton make_it_rain<CR>", "Make It Rain" }

            },
            g = {

                l = { "<cmd>CellularAutomaton game_of_life<CR>", "Game of Life" }
            }
        }, { prefix = "<leader>" })

        wk.register({

            J = { "mzJ`z" },

            ["C-u"] = { "<C-u>zz" },
            ["C-k"] = { "<cmd>cnext<CR>zz", "Next Item" },
            ["C-j"] = { "<cmd>cprev<CR>zz", "Prev Item" }

        }, {})


        wk.register({
            y = { [["+y"]] },
            d = { [["_d]] }
        }, { prefix = "<leader>", mode = { "n", "v" } })

        wk.register({
            p = { [["_dP]] }

        }, { prefix = "<leader>", mode = "x" })

        wk.register({
            J = { ":m '>+1<CR>gv=gv" },
            K = { ":m '<-2<CR>gv=gv" },

        }, { mode = "v" })
    end

}


--
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--
-- -- This is going to get me cancelled
--
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
--
-- vim.keymap.set("t", '<Esc>', '<C-\\><C-n>', { noremap = true })
