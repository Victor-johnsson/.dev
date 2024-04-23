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

autocmd({ "BufWritePre" }, {
    group = VictorGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

local function is_omnisharp(tab, val)
    for index, value in ipairs(tab) do
        if value.name == val then
            return true
        end
        return false
    end
end
autocmd('LspAttach', {
    group = VictorGroup,
    callback = function(e)
        -- Check if the attached LSP client is OmniSharp

        local opts = { buffer = e.buf }



        vim.keymap.set("n", "gd", function()
            local client = vim.lsp.get_active_clients()

            if is_omnisharp(client, 'omnisharp') then
                require('omnisharp_extended').lsp_definition()
            else
                vim.lsp.buf.definition()
            end
        end, opts)



        vim.keymap.set("n", "<leader>vrr", function()
            local client = vim.lsp.get_active_clients()

            if is_omnisharp(client, 'omnisharp') then
                require('omnisharp_extended').lsp_references()
            else
                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            end
        end, opts)

        vim.keymap.set("n", "<leader>gD", function()
            require('omnisharp_extended').lsp_type_definition()
        end, opts)
        vim.keymap.set("n", "<leader>vri", function()
            require('omnisharp_extended').lsp_implementation()
        end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
