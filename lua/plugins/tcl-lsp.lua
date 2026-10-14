return {
  {
    -- nagelfar as a language server. AstroNvim v6: servers are declared
    -- with vim.lsp.config through astrolsp's `config` and enabled through
    -- `servers`; the lspconfig.configs registry is gone.
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      servers = { "nagelfar" },
      config = {
        nagelfar = {
          cmd = { "tclsh", vim.fn.expand "~/.local/bin/nagelfar", "--stdin" },
          filetypes = { "tcl" },
          root_markers = { ".git", "pkgIndex.tcl" },
        },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = { treesitter = { ensure_installed = { "tcl" } } },
  },
}
