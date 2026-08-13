return {
  {
    dir = vim.fn.stdpath("config"),
    name = "rspec-component",
    lazy = false,
    config = function()
      vim.api.nvim_create_user_command("Rspec", function()
        require("util.rspec").run_spec()
      end, { desc = "Run current RSpec file for this component" })

      vim.api.nvim_create_user_command("RspecComponent", function()
        require("util.rspec").run_component_specs()
      end, { desc = "Run all specs for this component" })

      vim.api.nvim_create_user_command("RspecLine", function()
        require("util.rspec").run_spec_at_line()
      end, { desc = "Run current RSpec file at a given line" })
    end,
    keys = {
      { "<leader>rt", "<cmd>Rspec<cr>", desc = "Run current RSpec file" },
      { "<leader>rT", "<cmd>RspecComponent<cr>", desc = "Run all specs in component" },
      { "<leader>rl", "<cmd>RspecLine<cr>", desc = "Run current RSpec file at line" },
    },
  },
}
