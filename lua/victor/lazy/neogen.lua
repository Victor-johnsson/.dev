return {
    "danymat/neogen",
    config = function()
        local neogen = require("neogen")

        neogen.setup({
            enabled = true,
            languages = {
                cs = {
                    template = {
                        annotation_convention = "xmldoc"

                    }
                }


            }



        })


        local wk = require("which-key")
        wk.register({

            n = {

                f = { function() neogen.generate({ type = "func" }) end, "Generate docs for function" },
                c = { function() neogen.generate({ type = "class" }) end, "Generate docs for class" },
            }
        }, { prefix = "<leader>" })
        -- vim.keymap.set("n", "<leader>nf", function()
        --     neogen.generate({ type = "func" })
        -- end)
        --
        -- vim.keymap.set("n", "<leader>nc", function()
        --     neogen.generate({ type = "class" })
        -- end)
    end

}