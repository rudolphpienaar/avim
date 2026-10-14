-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            " █████  ███████ ████████ ██████    ██████ ",
            "██   ██ ██         ██    ██   ██ ██    ██",
            "███████ ███████    ██    ██████  ██    ██",
            "██   ██      ██    ██    ██   ██ ██    ██",
            "██   ██ ███████    ██    ██   ██  ██████ ",
            "",
            "███   ██ ██     ██ ██ ███     ███",
            "████  ██ ██     ██ ██ ████  ████",
            "██ ██ ██ ██     ██ ██ ██ ████ ██",
            "██  ████  ██   ██  ██ ██  ██  ██",
            "██   ████   ████   ██ ██      ██",
          }, "\n"),
        },
      },
    },
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    -- Tcl filetypes, the tclint server, and a diagnostics-to-clipboard
    -- mapping. AstroNvim v6 has no lspconfig config module to call (servers
    -- are vim.lsp.config/enable through astrolsp), so this hangs off
    -- astrocore instead of nvim-lspconfig.
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      vim.filetype.add {
        pattern = {
          ['.*.xdc'] = 'xdc',
          ['.*.upf'] = 'upf',
        },
      }

      opts.autocmds = opts.autocmds or {}
      opts.autocmds.tclint = {
        {
          event = "FileType",
          pattern = { "tcl", "sdc", "xdc", "upf" },
          desc = "Start tclint for Tcl-family buffers",
          callback = function(args)
            if vim.fn.executable "tclsp" == 1 then
              vim.lsp.start {
                name = "tclint",
                cmd = { "tclsp" },
                root_dir = vim.fs.root(args.buf, { "tclint.toml", ".tclint", "pyproject.toml" }),
              }
            end
          end,
        },
      }

      -- Keymap to copy diagnostics
      opts.mappings = opts.mappings or {}
      opts.mappings.n = opts.mappings.n or {}
      opts.mappings.n["<Leader>cy"] = { function()
        -- Use the standard vim.diagnostic.get() function
        -- It gets diagnostics for the current buffer (0) and filters by the current line number
        local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
        if not vim.tbl_isempty(diagnostics) then
          local messages = {}
          for _, d in ipairs(diagnostics) do
            table.insert(messages, d.message)
          end
          local full_message = table.concat(messages, "\n")

          -- Set the system clipboard register (+) with the message
          vim.fn.setreg("+", full_message)

          -- Print a confirmation
          print("Copied diagnostic to clipboard.")
        else
          print("No diagnostic on this line to copy.")
        end
      end, desc = "Copy Diagnostic to Clipboard" }

      return opts
    end,
  },

  -- ########################################################
  -- ## ADDED: Override for indentation settings           ##
  -- ########################################################
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        opt = {
          tabstop = 4,
          shiftwidth = 4,
          softtabstop = 4,
          expandtab = true,
        },
      },
    },
  },

}
