return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local lspconfig = require("lspconfig")
      local configs = require('lspconfig.configs')

      -- Add nagelfar LSP config
      if not configs.nagelfar then
        configs.nagelfar = {
          default_config = {
            cmd = { 'tclsh', vim.fn.expand('~/.local/bin/nagelfar'), '--stdin' },
            filetypes = { 'tcl' },
            root_dir = lspconfig.util.root_pattern('.git', 'pkgIndex.tcl'),
          }
        }
      end

      -- Add to the servers list
      if not opts.servers then opts.servers = {} end
      opts.servers.nagelfar = {}

      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if not opts.ensure_installed then opts.ensure_installed = {} end
      vim.list_extend(opts.ensure_installed, { "tcl" })
      return opts
    end,
  },
}
