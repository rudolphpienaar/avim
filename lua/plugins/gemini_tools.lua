--- gemini_tools.lua
--- AstroNvim configuration for the Gemini API plugin.
return {
  "kiddos/gemini.nvim",
  cmd = {
    "GeminiGenerate", "GeminiCodeReview", "GeminiUnitTest",
    "GeminiExplain", "GeminiGenerateGitCommitLog"
  },
  opts = {
    -- Configuration will use the GEMINI_API_KEY env var
    model = "gemini-2.5-pro", -- Use your paid access to a powerful model
  },
  keys = {
    -- Keymap for Code Review on visual selection
    { "<leader>gr", mode = { "v" }, "<cmd>GeminiCodeReview<cr>", desc = "Gemini: Code Review" },
    -- Keymap for generating Unit Tests on visual selection
    { "<leader>gt", mode = { "v" }, "<cmd>GeminiUnitTest<cr>", desc = "Gemini: Generate Test" },
    -- Keymap for generating a Commit Message based on Git diff
    { "<leader>gc", "<cmd>GeminiGenerateGitCommitLog<cr>", desc = "Gemini: Generate Commit Msg" },
  },
  config = true,
}
