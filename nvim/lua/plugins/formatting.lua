return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      rubocop = {
        command = "bundle",
        args = { "exec", "rubocop", "-a", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
        cwd = require("conform.util").root_file({ "Gemfile" }),
      },
    },
  },
}
