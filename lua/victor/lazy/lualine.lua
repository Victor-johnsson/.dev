return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'palenight',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { { 'mode', fmt = function(str) return ' ' .. str .. ' ' end } },   -- left
                lualine_b = { { 'branch', icon = '' } },   -- mid                             -- right
                lualine_c = { { 'filename', path = 1 } },    -- mid
                lualine_x = { { 'diagnostics', sources = { 'nvim_diagnostic' } } },   -- right                             -- right
                lualine_y = { { 'filetype' } },   -- right
                lualine_z = { { 'progress', fmt = function(str) return ' ' .. str .. ' ' end } },   -- right
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},



        })
    end
}
