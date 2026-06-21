-- Customize Mason

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- language servers
        "lua-language-server",
        "texlab",        -- LaTeX LSP: completion, diagnostics, goto-def

        -- formatters
        "stylua",

        -- debuggers
        "debugpy",

        -- tree-sitter-cli: pre-built linux binary doesn't run on Android bionic;
        -- system pkg tree-sitter is symlinked into mason/bin instead
      },
    },
  },
}
