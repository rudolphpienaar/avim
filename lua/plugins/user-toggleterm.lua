return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy", 
  config = function()
    require("toggleterm").setup {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        width = function() return math.floor(vim.o.columns * 0.5) end,
        height = function() return math.floor(vim.o.lines * 0.5) end,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    }
  end,
}

