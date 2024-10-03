return {
    -- "nvim-neotest/neotest",
    -- dependencies = {
    --     "nvim-neotest/nvim-nio",
    --     "nvim-neotest/neotest-plenary",
    --     "nvim-neotest/neotest-vim-test",
    --     "Issafalcon/neotest-dotnet",
    --     "nvim-lua/plenary.nvim",
    --     "antoinemadec/FixCursorHold.nvim",
    --     "nvim-treesitter/nvim-treesitter"
    -- },
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "Issafalcon/neotest-dotnet",
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-dotnet")({
                    -- Provide any additional "dotnet test" CLI commands here. These will be applied to ALL test runs performed via neotest. These need to be a table of strings, ideally with one key-value pair per item.
                    dotnet_additional_args = {
                        "--verbosity detailed"
                    },
                    -- Tell neotest-dotnet to use either solution (requires .sln file) or project (requires .csproj or .fsproj file) as project root
                    -- Note: If neovim is opened from the solution root, using the 'project' setting may sometimes find all nested projects, however,
                    --       to locate all test projects in the solution more reliably (if a .sln file is present) then 'solution' is better.
                    discovery_root = "project" -- Default
                })
            }
        })
        -- require("neotest-plenary")
        -- require("neotest-vim-test")

        local wk = require("which-key")
        wk.add({
            { "<leader>nt", function() require("neotest").run.run({ vim.fn.expand("%"), dotnet_additional_args = {} }) end, desc = "Run tests" }


        })
    end
}
