return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")



    wk.add({
      { "<leader>Y", [["=]] },
      { "<leader>k", "<cmd>lnext<CR>zz" },

      { "<leader>j", "<cmd>lprev<CR>zz" },
      -- { "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Replace word in whole file", noremap = false },
      {
        "<leader>f",
        function()
          require("conform").format({
            async = true,
            lsp_fallback = true

          })
        end,
        desc = "Format document"
      },
      { "<leader>mir", "<cmd>CellularAutomaton make_it_rain<CR>",   desc = "Make It Rain" },
      { "<leader>gi", function() vim.lsp.buf.implementation() end, desc = "Goto Implementation" },

      { "J",          "mzJ`z" },
      { "<C-u>",      "<C-u>zz" },
      { "<C-k>",      "<cmd>cnext<CR>zz",                          desc = "Next Item" },
      { "<C-j>",      "<cmd>cprev<CR>zz",                          desc = "Prev Item" },
      {
        mode = { "n", "v" },
        { "<leader>y", [["+y"]] },
        { "<leader>d", [["_d]] },

      },
      {
        mode = { "x" },
        { "<leader>p", [["_dP]] },
      },
      {
        mode = { "v" },
        { "<leader>J", ":m '>+1<CR>gv=gv" },
        { "<leader>K", ":m '<-2<CR>gv=gv" },
      },
    })
    wk.add({
      { "<leader>nat", function() require("neotest").run.run({ vim.fn.expand("%"), dotnet_additional_args = {} }) end, desc = "Run all tests" },
      { "<leader>nt",  function() require("neotest").run.run() end,                                                    desc = "Run tests" },


      { "<leader>nb", "<cmd>DotnetBuild<CR>", desc = "Build .NET project" },
      { "<leader>nr", "<cmd>AspireRun<CR>", desc = "Run Aspire project" },


    })
  end

}
