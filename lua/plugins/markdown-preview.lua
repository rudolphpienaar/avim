---@type LazySpec
return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
  build = function() vim.fn["mkdp#util#install"]() end,
  -- set globals before the plugin loads
  init = function()
    vim.g.mkdp_browser = "vivaldi-snapshot"
    vim.g.mkdp_echo_preview_url = 1
    vim.g.mkdp_port = 0
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
