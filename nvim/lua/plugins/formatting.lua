return {
  "stevearc/conform.nvim",
  opts = {
    log_level = vim.log.levels.DEBUG,
    formatters = {
      rubocop = {
        command = "bundle",
        args = { "exec", "rubocop", "-a", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
        cwd = require("conform.util").root_file({ "Gemfile" }),
      },
    },
  },
}
