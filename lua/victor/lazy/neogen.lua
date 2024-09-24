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
        wk.add({

            { "<leader>nf", function() neogen.generate({ type = "func" }) end,  desc = "Generate docs for function" },
            { "<leader>nc", function() neogen.generate({ type = "class" }) end, desc = "Generate docs for class" }
        })
    end

}

