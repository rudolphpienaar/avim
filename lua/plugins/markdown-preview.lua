---@type LazySpec
return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  cmd = { "MarkdownPreview", "MarkdownPreviewToggle", "MarkdownPreviewStop" },
  build = function() vim.fn["mkdp#util#install"]() end,
  -- set globals before the plugin loads
  init = function()
    vim.cmd([[
      function! MkdpOpenSystemDefault(url) abort
        if has('mac')
          call jobstart(['open', a:url], {'detach': v:true})
        elseif has('win32')
          call jobstart(['cmd.exe', '/c', 'start', '', a:url], {'detach': v:true})
        else
          call jobstart(['xdg-open', a:url], {'detach': v:true})
        endif
      endfunction
    ]])
    vim.g.mkdp_browserfunc = "MkdpOpenSystemDefault"
    vim.g.mkdp_echo_preview_url = 1
    vim.g.mkdp_port = 0
    vim.g.mkdp_filetypes = { "markdown" }
  end,
}
