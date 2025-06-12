---@type LazySpec
return {
  "tigion/nvim-asciidoc-preview",
  ft = { "asciidoc", "adoc" },
  build = "cd server && npm install --omit=dev",
  opts = {
    server = { converter = "js" },
    preview = { position = "current" },
  },
  keys = {
    {
      "<Leader>cp",
      ":AsciiDocPreview<CR>",
      desc = "Preview AsciiDoc document",
    },
  },
}

