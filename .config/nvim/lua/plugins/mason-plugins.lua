return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      "flake8",
      "typescript-language-server",
      "css-lsp",
      "html-lsp",
      "svelte-language-server",
      "rust-analyzer",
    },
  },
}
