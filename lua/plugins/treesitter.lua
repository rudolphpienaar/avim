-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "python",
      "latex",   -- parser for structure/folding (highlight disabled below)
      "bibtex",  -- .bib bibliography files
    },
    highlight = {
      -- Disable treesitter highlighting for latex — the bundled highlight
      -- queries use nodes (curly_group_text) not present in the installed
      -- parser. Vimtex provides better latex syntax highlighting anyway.
      disable = { "latex" },
    },
  },
}
