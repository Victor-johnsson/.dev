return {
    'mfussenegger/nvim-dap',

    config = function()
        local dap = require('dap')

        dap.adapters.coreclr = {
            type = 'executable',
            command = 'C:/Users/vjohnsso/netcoredbg/netcoredbg.exe',
            args = { '--interpreter=vscode' }
        }

        dap.configurations.cs = {
            {
                type = "coreclr",
                name = "launch - netcoredbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
                end,
            },
        }
    end
}
