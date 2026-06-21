-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "python",
      "latex",   -- syntax highlighting for .tex files
      "bibtex",  -- .bib bibliography files
    },
  },
}
