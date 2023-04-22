-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local api = vim.api

local fancyText = api.nvim_create_augroup("breakText", { clear = true })
api.nvim_create_autocmd("BufReadPre", {
  pattern = { "*.txt", "*.md", "*.typ" },
  command = "set lbr | set wrap",
  group = fancyText,
})

api.nvim_create_autocmd("BufReadPost", {
  command = "set nospell",
})

local nonvimGroup = api.nvim_create_augroup("nonvim", { clear = true })
api.nvim_create_autocmd("BufReadCmd", {
  pattern = "*.pdf",
  command = "silent! exe '!xdg-open' shellescape(expand('<afile>')) | bd",
  group = nonvimGroup,
})

-- local typProcess = api.nvim_create_augroup("typProcess", { clear = true })
-- api.nvim_create_autocmd("BufReadCmd", {
--   pattern = "*.typ",
--   command = "",
--   group = typProcess,
-- })
