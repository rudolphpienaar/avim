-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
--

-- UNIFIED clipboard provider: Wayland→wl-clipboard, X11→xclip, SSH→osc52
local has = function(bin) return vim.fn.executable(bin) == 1 end
local is_wayland = vim.env.WAYLAND_DISPLAY ~= nil
local is_ssh     = (vim.env.SSH_TTY or vim.env.SSH_CONNECTION) ~= nil
local prefer     = vim.env.NVIM_CLIP  -- optional override: "wl"|"x11"|"osc52"

-- Explicit providers (table form is portable and unambiguous)
local WL = {
  name = "wl-clipboard",
  copy  = { ["+"] = { "wl-copy" }, ["*"] = { "wl-copy" } },
  paste = { ["+"] = { "wl-paste", "-n" }, ["*"] = { "wl-paste", "-n" } },
  cache_enabled = 0,
}
local X11 = {
  name = "xclip",
  copy  = {
    ["+"] = { "xclip", "-selection", "clipboard" },
    ["*"] = { "xclip", "-selection", "primary"   },
  },
  paste = {
    ["+"] = { "xclip", "-selection", "clipboard", "-o" },
    ["*"] = { "xclip", "-selection", "primary",   "-o" },
  },
  cache_enabled = 0,
}

if     prefer == "wl"   and has("wl-copy") and has("wl-paste") then
  vim.g.clipboard = WL
elseif prefer == "x11"  and has("xclip") then
  vim.g.clipboard = X11
elseif prefer == "osc52" or (is_ssh and not is_wayland and not has("xclip")) then
  -- Use built-in OSC52 on remote when X forwarding is not in play
  vim.g.clipboard = nil
  local tf = vim.g.termfeatures or {}; tf.osc52 = true; vim.g.termfeatures = tf
elseif is_wayland and has("wl-copy") and has("wl-paste") then
  vim.g.clipboard = WL
elseif has("xclip") then
  vim.g.clipboard = X11
else
  vim.g.clipboard = nil
  local tf = vim.g.termfeatures or {}; tf.osc52 = true; vim.g.termfeatures = tf
end

vim.opt.clipboard = "unnamedplus"

-- If we selected a concrete provider, prevent OSC52 auto-detect from overriding it
if vim.g.clipboard ~= nil then
  local tf = vim.g.termfeatures or {}; tf.osc52 = false; vim.g.termfeatures = tf
end


local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

-- Re-enable netrw so sftp/scp URIs work in AstroNvim
vim.g.loaded_netrw = nil
vim.g.loaded_netrwPlugin = nil
vim.cmd('runtime! plugin/netrwPlugin.vim')


-- init.lua
vim.opt.clipboard = "unnamedplus"        -- make yanks use +
vim.g.clipboard = 'osc52'                -- force built-in OSC52 provider

