return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {

      -- MAIN SEARCH: prompt for filetype (empty = all)
      {
        "<leader>sg",
        function()
          local ft = vim.fn.input("Filetype (empty = all): ")
          local lga = require("telescope").extensions.live_grep_args

          if ft == "" then
            lga.live_grep_args()
          else
            lga.live_grep_args({
              additional_args = function()
                return { "-t", ft }
              end,
            })
          end
        end,
        mode = "n",
        desc = "Search by text (optional filetype filter)",
      },

      -- SEARCH WORD UNDER CURSOR
      {
        "<leader>sw",
        function()
          local word = vim.fn.expand("<cword>")
          require("telescope").extensions.live_grep_args.live_grep_args({
            default_text = word,
          })
        end,
        desc = "Search word under cursor",
      },

      -- PICK FILETYPE FROM A DROPDOWN BEFORE SEARCHING
      {
        "<leader>sF",
        function()
          local filetypes = {
            "lua",
            "javascript",
            "typescript",
            "tsx",
            "ruby",
            "python",
            "go",
            "rust",
            "json",
            "html",
            "css",
          }

          vim.ui.select(filetypes, { prompt = "Choose filetype:" }, function(ft)
            if not ft then
              return
            end
            require("telescope").extensions.live_grep_args.live_grep_args({
              additional_args = function()
                return { "-t", ft }
              end,
            })
          end)
        end,
        desc = "Search with selectable filetype",
      },
    },
  },
}
