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
    -- Disable auto-install: the latex parser's highlight queries reference
    -- curly_group_text nodes absent from the installed grammar on Termux,
    -- causing errors. Vimtex handles latex syntax instead.
    auto_install = false,
    highlight = {
      disable = { "latex" },
    },
  },
}
