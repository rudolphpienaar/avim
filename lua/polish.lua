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

    -- reStructuredText preview through restview (docutils in a browser, the
    -- renderer PyPI uses; reloads on save). Install once: uv tool install restview
    local function restview_find()
      local found = vim.fn.exepath "restview"
      if found ~= "" then return found end
      local home = vim.fn.expand "~/.local/bin/restview"
      if vim.fn.executable(home) == 1 then return home end
      return nil
    end
    vim.api.nvim_create_user_command("RstPreview", function()
      local restview = restview_find()
      if not restview then
        vim.notify("RstPreview: restview not found; run: uv tool install restview", vim.log.levels.WARN)
        return
      end
      -- docutils' default stylesheet is 1990s; mvp.css plus a few docutils rules.
      -- water.css is in assets too; swap the first --css to use it.
      local assets = vim.fn.stdpath "config" .. "/assets"
      vim.fn.jobstart({
        restview,
        "--css", assets .. "/mvp.css",
        "--css", assets .. "/rst.css",
        vim.fn.expand "%:p",
      }, { detach = true })
    end, { desc = "Preview the current rst file in a browser, reloading on save" })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "rst",
      callback = function(event)
        vim.keymap.set("n", "<Leader>cp", "<Cmd>RstPreview<CR>", { buffer = event.buf, desc = "Preview rst document" })
      end,
    })

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

