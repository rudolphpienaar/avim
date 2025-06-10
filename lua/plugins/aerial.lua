---@type LazySpec
return {
  "stevearc/aerial.nvim",
  event = "LspAttach",
  opts = {
    layout = {
      max_width = { 40, 0.25 },
      min_width = 25,
      default_direction = "left", -- open on the left
    },
    show_guides = true,
    backends = { "lsp", "treesitter", "markdown" },
    attach_mode = "window",
    filter_kind = false,
  },
  keys = {
    {
      "<leader>lo",
      "<cmd>AerialToggle<cr>",
      desc = "Toggle code outline (Aerial)",
    },
    {
      "<leader>lO",
      function()
        local win = require("aerial").get_aerial_win()
        if win and vim.api.nvim_get_current_win() ~= win then
          vim.api.nvim_set_current_win(win) -- jump into aerial
        else
          vim.cmd.wincmd("p") -- jump back
        end
      end,
      desc = "Toggle focus between code and outline",
    },
  },
}

