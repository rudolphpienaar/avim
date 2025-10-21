--- @module 'openai_gpt'
--- AstroNvim configuration for gp.nvim using OpenAI API.
return {
  "robitx/gp.nvim",
  cmd = { "Gp", "GpChat" },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    openai_api_key = os.getenv("OPENAI_API_KEY"),
    default_model = "gpt-4o",
  },
  keys = {
    -- Keymap to start a chat session
    { "<leader>oc", "<cmd>GpChat<cr>", desc = "OpenAI Chat" },
    -- Keymap to instruct selected code
    { "<leader>oi", mode = { "v" }, "<cmd>Gp 'Please refactor this TypeScript code to be more idiomatic.'<cr>", desc = "OpenAI: Instruct" },
  },
  config = true,
}
