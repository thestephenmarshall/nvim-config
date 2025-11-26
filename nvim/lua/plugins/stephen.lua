return {
  { "lewis6991/gitsigns.nvim" },
  { "todo-comments.nvim" },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "gpt-4.1", -- AI model to use
      temperature = 0.1, -- Lower = focused, higher = creative
      window = {
        layout = "vertical", -- 'vertical', 'horizontal', 'float'
        width = 0.4, -- 50% of screen width
      },
      auto_insert_mode = true, -- Enter insert mode when opening
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sg",
        function()
          local ft = vim.fn.input("Filetype (empty = all): ")

          local telescope = require("lazyvim.util").telescope

          if ft == "" then
            -- No filtering → use LazyVim's contextual root-based live_grep
            telescope("live_grep")()
          else
            -- Filetype filter, still respecting root detection
            telescope("live_grep", {
              additional_args = function()
                return { "-t", ft }
              end,
            })()
          end
        end,
        desc = "Grep (filtered by filetype)",
      },
    },
  },
}
