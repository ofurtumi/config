return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- { "tanvirtin/monokai.nvim" },
  { "catppuccin/nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
