return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        mason = false,
        cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
      },
      rubocop = {
        enabled = false,
        mason = false,
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
      },
    },
  },
}
