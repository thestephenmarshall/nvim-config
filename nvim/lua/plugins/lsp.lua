return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        mason = false,
        cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
        root_markers = { ".git" },
      },
      rubocop = {
        enabled = false,
        mason = false,
        cmd = { "bundle", "exec", "rubocop", "--lsp" },
      },
    },
  },
}
