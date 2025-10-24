-- Local helper plugin: Fix escaped quotes in XML buffers with sed
return {
  name = "fix-xml-sed",
  dir = vim.fn.stdpath("config") .. "/lua/victor/lazy", -- tell Lazy it's local
  dev = true,                                            -- explicitly local
  lazy = false,                                          -- always load
  priority = 1000,                                       -- ensure it runs early enough

  config = function()
    vim.keymap.set("n", "<leader>fx", function()
      local buf = vim.api.nvim_get_current_buf()
      local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
      local text = table.concat(lines, "\n")

      -- Run sed command: replace \" with "
      local result = vim.fn.systemlist([[sed 's/\\"/"/g']], text)

      -- Replace buffer with output
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)
      vim.notify("✅ Fixed escaped quotes with sed", vim.log.levels.INFO)
    end, { desc = "Fix escaped quotes in XML with sed" })
  end,
}
