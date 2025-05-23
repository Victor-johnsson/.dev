require("victor.remap")
require("victor.set")
require("victor.lazy_init")

local augroup = vim.api.nvim_create_augroup
local VictorGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
  require("plenary.reload").reload_module(name)
end

vim.filetype.add({
  extension = {
    templ = 'templ',
  }
})

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
    ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
  },
}
autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})


vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

autocmd({ "BufWritePre" }, {
  group = VictorGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.cs",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- autocmd('LspAttach', {
--   group = VictorGroup,
--   callback = function(e)
--     local opts = { buffer = e.buf }
--
--
--
--     vim.keymap.set("n", "gd", function()
--       vim.lsp.buf.definition()
--     end, opts)
--
--
--
--     vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
--
--     vim.keymap.set("n", "<leader>gD", function()
--       vim.lsp.buf.type_definition()
--     end, opts)
--     vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--     vim.keymap.set("n", "gK", function() vim.lsp.buf.signature_help() end, opts)
--     vim.keymap.set("i", "<c-k>", function() vim.lsp.buf.signature_help() end, opts)
--     vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--     vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--     vim.keymap.set({ "n", "v" }, "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
--     vim.keymap.set({ "n", "v" }, "<leader>cl", function() vim.lsp.codelens.run() end, opts)
--     vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
--     vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--     vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
--     vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
--   end
-- })

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
