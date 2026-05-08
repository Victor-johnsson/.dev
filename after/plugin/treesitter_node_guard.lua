-- Patch vim.treesitter.get_range to guard against invalidated TSNodes.
-- Neovim nightly (v0.13.0-dev) calls node:range() without checking if the
-- node is still valid, causing "attempt to call method 'range' (a nil value)"
-- when treesitter injection queries (e.g. #set-lang-from-info-string!,
-- #downcase!, or @injection.language) run on markdown fenced code blocks.
-- TODO: remove once the fix lands in a stable Neovim build.
local orig_get_range = vim.treesitter.get_range
vim.treesitter.get_range = function(node, source, metadata)
    if not node or not node.range then
        return { 0, 0, 0, 0, 0, 0 }
    end
    return orig_get_range(node, source, metadata)
end
