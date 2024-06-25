return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "Issafalcon/neotest-dotnet",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter"
    },

    config = function()
        require("neotest").setup({

                adapters = {

                    require("neotest-dotnet")({

                        discovery_root = "solution"

                    })

                }

            },

            vim.keymap.set("n", "nt", function()
                require("neotest").run.run();
            end)

        )
    end
}
