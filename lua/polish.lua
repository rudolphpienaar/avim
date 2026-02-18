return {
  polish = function()
    vim.opt.clipboard = ""  -- disable auto system clipboard on yank
    -- Diagnostic signs
    local signs = {
      Error = "",
      Warn  = "",
      Hint  = "",
      Info  = "",
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- -- Underline styles for diagnostics
    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "Red" })
    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { underline = true, sp = "Yellow" })
    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { underline = true, sp = "Green" })
    -- vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { underline = true, sp = "Blue" })
    --
    -- -- Autoformat on save
    -- vim.api.nvim_create_autocmd("BufWritePre", {
    --   callback = function()
    --     vim.lsp.buf.format({ async = false })
    --   end,
    -- })
    --
    -- -- Highlight trailing whitespace
    -- vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
    -- vim.cmd('match ExtraWhitespace /\\s\\+$/')
    --
    -- -- Define command to strip trailing whitespace
    -- vim.cmd('command! -bar StripWhiteSpace %s/\\s\\+$//e')
    --
    -- -- Restore floating diagnostics on CursorHold
    -- vim.opt.updatetime = 300
    -- vim.api.nvim_create_autocmd("CursorHold", {
    --   callback = function()
    --     vim.diagnostic.open_float(nil, {
    --       focusable = false,
    --       close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    --       border = "rounded",
    --       source = "always",
    --       prefix = " ",
    --     })
    --   end,
    -- })
  end,
}

