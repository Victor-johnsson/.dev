; Override nvim-treesitter's markdown injections to avoid the
; #set-lang-from-info-string! directive, which crashes on Neovim nightly
; builds where node:range() is called without a validity guard
; (vim/treesitter.lua get_range). Uses #downcase! + #set! injection.language
; as the safe equivalent.
; TODO: remove this file once the Neovim fix is in a stable build.

(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content
  (#downcase! @injection.language))

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))
