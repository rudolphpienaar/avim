-- lua/user/plugins/copilot.lua
return {
  {
    -- Adapter for GitHub Copilot
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      servers = {
        -- Ensure copilot is configured
        ["copilot"] = {
          -- These are the default settings from nvim-lspconfig
          -- You can add your own specific configurations here
          filetypes = {
            ["*"] = true,
            ["markdown"] = true,
            ["help"] = true,
            ["gitcommit"] = true,
          },
        },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- Ensure the copilot language server is installed
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "copilot-lsp")
    end,
  },
}
