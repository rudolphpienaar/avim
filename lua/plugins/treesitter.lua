-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "python",
      "bibtex",  -- .bib bibliography files
    },
    highlight = {
      -- latex parser is installed but its highlight queries reference nodes
      -- (curly_group_text) that don't exist in the installed grammar version.
      -- Vimtex handles latex syntax highlighting instead.
      disable = { "latex" },
    },
  },
}
