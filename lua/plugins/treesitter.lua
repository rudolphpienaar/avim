-- Treesitter. AstroNvim v6 drives nvim-treesitter (its `main` branch) from
-- astrocore's `treesitter` options: parsers auto-install per filetype, and
-- highlighting starts per buffer. The old `nvim-treesitter.configs` options
-- (ensure_installed, highlight.disable, auto_install) no longer exist.
-- Needs the tree-sitter CLI and a C compiler to build parsers.

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      ensure_installed = {
        "lua",
        "vim",
        "python",
        "bibtex", -- .bib bibliography files
      },
      -- vimtex owns LaTeX: the latex parser's highlight queries referenced
      -- nodes absent from the installed grammar on Termux. Large buffers
      -- stay off as AstroNvim's default does.
      enabled = function(_, bufnr)
        return vim.bo[bufnr].filetype ~= "tex" and not require("astrocore.buffer").is_large(bufnr)
      end,
    },
  },
}
