return {
  { "lewis6991/gitsigns.nvim" },
  { "todo-comments.nvim" },
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
