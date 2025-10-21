--- @module 'codeium'
--- AstroNvim configuration for the Codeium plugin.
return {
  "Exafunction/codeium.nvim",
  cmd = "Codeium",
  event = "InsertEnter",
  build = ":Codeium Auth",
  opts = {
    virtual_text = {
      -- Disable default accept keymap to integrate with AstroNvim's <Tab> setup
      key_bindings = { accept = false },
    },
  },
  specs = {
    {
      "AstroNvim/astrocore",
      opts = {
        options = {
          g = {
            -- Set the global function that accepts AI suggestions
            ai_accept = function()
              require("codeium.virtual_text").get_current_completion_item()
              vim.api.nvim_input(require("codeium.virtual_text").accept())
              return true
            end,
          },
        },
      },
    },
  },
}
