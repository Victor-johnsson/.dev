return {
    'stevearc/conform.nvim',
    opts = {
        format_on_save = function()
            return {
                timeout_ms = 900,
                lsp_fallback = false
            }
        end,
        formatters_by_ft = {
            props = { "xmlformat" },
            xml = { "xmlformat" },
            yaml = { "yamlfmt" },
            json = { "jq" },
            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },
            html = { "prettier" },

        },

        formatters = {

            xmlformat = {
                command = vim.fn.stdpath("data") .. "/mason/bin/xmlformat",
                args = {
                    "--indent", "2",
                    "-",
                },
            },
            yamlfmt = {
                command = "yamlfmt",
                -- args = { "/dev/stdin" }
            },
            jq = {
                command = "jq",
                args = { "." },
            }



        }
    },
    init = function()
        vim.filetype.add({
            extension = {
                props = "xml",
            },
        })
    end,
}


-- return {
--
--   "sbdch/neoformat",
--   config = function()
--
--
--   end
-- }
