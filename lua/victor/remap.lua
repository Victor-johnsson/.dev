vim.g.mapleader = " "





vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)



-- -- Remap 'Shift+R' to start recording macros, mimicking 'q'
-- vim.keymap.set(
--     'n',
--     '<leader>q',
--     function()
--         vim.cmd('normal! q')
--     end,
--     { noremap = true, silent = true })
-- vim.keymap.set('v', '<leader>q', 'q', { noremap = true, silent = true })
--
-- -- -- Optional: Disable 'q' for recording to avoid conflicts
-- vim.keymap.set('n', 'q', '<Nop>', { noremap = true, silent = true })
-- vim.keymap.set('v', 'q', '<Nop>', { noremap = true, silent = true })
