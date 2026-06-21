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

        -- other
        "tree-sitter-cli",
      },
    },
  },
}
