-- File: ~/.config/nvim/lua/user/init.lua

-- Highlight trailing whitespace
vim.cmd([[highlight ExtraWhitespace ctermbg=red guibg=red]])
vim.cmd([[match ExtraWhitespace /\s\+$/]])

-- Strip trailing whitespace command
vim.cmd([[command! -bar StripWhiteSpace %s/\s\+$//e]])

-- Floating diagnostics on CursorHold
vim.opt.updatetime = 300
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
    })
  end,
})

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    pcall(function() vim.lsp.buf.format({ async = false }) end)
  end,
})

