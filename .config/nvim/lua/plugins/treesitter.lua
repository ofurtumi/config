return {
  "nvim-treesitter/nvim-treesitter",

  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, {
      "bash",
      "help",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    })
  end,
}

-- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
-- would overwrite `ensure_installed` with the new value.
-- If you'd rather extend the default config, use the code below instead:
