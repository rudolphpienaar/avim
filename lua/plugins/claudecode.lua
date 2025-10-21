--- @module 'claudecode'
--- AstroNvim configuration for the Claude Code CLI plugin.
return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" }, -- Required for terminal/UI support
    cmd = "ClaudeCode",
    keys = {
      -- Keymap to start/toggle the Claude Code session
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code Chat" },
      -- Keymap to accept the proposed diff changes from Claude
      { "<leader>aa", mode = { "n", "v" }, "<cmd>ClaudeCodeAccept<cr>", desc = "Accept Claude Diff" },
      -- Keymap to reject the proposed diff changes from Claude
      { "<leader>ad", mode = { "n", "v" }, "<cmd>ClaudeCodeDiscard<cr>", desc = "Discard Claude Diff" },
    },
    config = true,
  },
}
