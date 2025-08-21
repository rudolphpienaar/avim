-- ~/.config/astronvim/lua/plugins/osc52.lua
return {
  "ojroques/nvim-osc52",
  event = "VeryLazy",
  config = function()
    require('osc52').setup({
      max_length = 0,          -- No limit on selection length
      silent = false,          -- Show "Copied!" message
      trim = false,            -- Don't trim whitespace
      tmux_passthrough = true, -- Important if you use tmux
    })

    -- Auto-copy when yanking to system clipboard
    vim.api.nvim_create_autocmd('TextYankPost', {
      group = vim.api.nvim_create_augroup('osc52_yank', { clear = true }),
      callback = function()
        if vim.v.event.operator == 'y' and vim.v.event.regname == '+' then
          require('osc52').copy_register('+')
        end
      end,
    })
  end,
}
