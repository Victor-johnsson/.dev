return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "nvim-neotest/neotest-plenary",
        -- "nvim-lua/neotest-plenary",
        "nvim-neotest/neotest-vim-test",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "Victor-johnsson/neotest-dotnet",
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        require("neotest").setup({

            output = {
                enabled = true,
                open_on_run = true
            },
            adapters = {
                require("neotest-plenary"),
                require("neotest-vim-test")({
                    ignore_file_types = { "python", "vim", "lua" },
                }),
                require("neotest-dotnet")({
                    -- Let the test-discovery know about your custom attributes (otherwise tests will not be picked up)
                    -- Note: Only custom attributes for non-parameterized tests should be added here. See the support note about parameterized tests
                    -- Provide any additional "dotnet test" CLI commands here. These will be applied to ALL test runs performed via neotest. These need to be a table of strings, ideally with one key-value pair per item.
                    dotnet_additional_args = {
                        -- "--verbosity detied"
                    },
                    -- Tell neotest-dotnet to use either solution (requires .sln file) or project (requires .csproj or .fsproj file) as project root
                    -- Note: If neovim is opened from the solution root, using the 'project' setting may sometimes find all nested projects, however,
                    --       to locate all test projects in the solution more reliably (if a .sln file is present) then 'solution' is better.
                    discovery_root = "solution" -- Default
                })
            },
        })
    end
}
