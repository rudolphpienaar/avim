---@type LazySpec
return {
  "tigion/nvim-asciidoc-preview",
  ft = { "asciidoc", "adoc" },
  build = "cd server && npm install --omit=dev",
  opts = {
    server = { converter = "js" },
    preview = { position = "current" },
  },
  config = function(_, opts)
    local preview = require "asciidoc-preview"
    preview.setup(opts)

    -- Override browser opener with explicit fallbacks and clear warnings.
    preview.open_browser = function()
      local config = require "asciidoc-preview.config"
      local url = config.server.url
      local opener = nil

      if vim.fn.has "mac" == 1 then
        opener = { "open", url }
      elseif vim.fn.has "win32" == 1 then
        opener = { "cmd.exe", "/c", "start", "", url }
      elseif vim.fn.has "wsl" == 1 and vim.fn.executable "wslview" == 1 then
        opener = { "wslview", url }
      elseif vim.fn.executable "xdg-open" == 1 then
        opener = { "xdg-open", url }
      end

      if opener then
        vim.system(opener, { detach = true })
      else
        vim.notify("nvim-asciidoc-preview: No browser opener found (expected xdg-open/wslview/open).", vim.log.levels.WARN)
      end
    end
  end,
  keys = {
    {
      "<Leader>cp",
      ":AsciiDocPreview<CR>",
      desc = "Preview AsciiDoc document",
    },
  },
}
