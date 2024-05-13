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


        vim.keymap.set("n", "<leader>nf", function()
            neogen.generate({ type = "func" })
        end)

        vim.keymap.set("n", "<leader>nc", function()
            neogen.generate({ type = "class" })
        end)
    end

}
