return {
  polish = function()
    -- Define diagnostic signs
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

    -- Ensure underlines are styled
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { underline = true, sp = "Red" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn",  { underline = true, sp = "Yellow" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint",  { underline = true, sp = "Green" })
    vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo",  { underline = true, sp = "Blue" })
  end,
}

