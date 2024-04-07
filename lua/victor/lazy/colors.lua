return {
   {
        "rebelot/kanagawa.nvim",

        config = function()
            require("kanagawa").setup({


                undercurl = true,
                theme = "wave",              -- Load "wave" theme when 'background' option is not set
                 commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,
    background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
    },


            })
            vim.cmd("colorscheme kanagawa")
        end


   },


}

