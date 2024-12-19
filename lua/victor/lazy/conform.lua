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
      cs = { "csharpier" }

    },

    formatters = {

      xmlformat = {
        command = vim.fn.stdpath("data") .. "/mason/bin/xmlformat",
        args = {
          "--indent", "2",
          "--preserve-whitespace",
          "--multiple-attributes-on-new-line",
          "--compress",
          "--preserve-format",
          "-",
        },
      },
      csharpier = {

        command = "dotnet-csharpier",
        args = { "--write-stdout" }
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
