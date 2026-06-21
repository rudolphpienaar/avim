-- VimTeX: LaTeX editing, compilation, navigation, and SyncTeX
-- https://github.com/lervag/vimtex

---@type LazySpec
return {
  "lervag/vimtex",
  lazy = false, -- must load at startup so filetype detection works
  init = function()
    -- Compiler: latexmk (matches project Makefile behaviour)
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      options = {
        "-pdf",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-synctex=1",
      },
    }

    -- PDF viewer with SyncTeX (set to "general" if zathura not available)
    vim.g.vimtex_view_method = "zathura"

    -- Disable vimtex imaps — LuaSnip handles all snippet expansion
    vim.g.vimtex_imaps_enabled = 0

    -- Quickfix: open on errors only, not warnings
    vim.g.vimtex_quickfix_mode = 2
    vim.g.vimtex_quickfix_open_on_warning = 0

    -- Folding by sections and environments
    vim.g.vimtex_fold_enabled = 1

    -- Completion (omnifunc, works alongside LSP/blink.cmp)
    vim.g.vimtex_complete_enabled = 1
    vim.g.vimtex_complete_close_braces = 1
  end,
}
