return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {

      ------------------------------------------------------------------
      -- OVERRIDE LazyVim FILE PICKERS (this is required)
      ------------------------------------------------------------------

      {
        "<leader>ff",
        function()
          LazyVim.pick("files", {
            hidden = true,
          })()
        end,
        desc = "Find files (includes hidden)",
      },

      {
        "<leader>fF",
        function()
          LazyVim.pick("files", {
            hidden = true,
            cwd = LazyVim.root(),
          })()
        end,
        desc = "Find files in project root (includes hidden)",
      },

      ------------------------------------------------------------------
      -- GLOBAL SEARCH (live_grep_args, includes hidden)
      ------------------------------------------------------------------

      {
        "<leader>sG",
        function()
          require("telescope").extensions.live_grep_args.live_grep_args({
            additional_args = function()
              return { "--hidden", "--glob", "!.git/*" }
            end,
          })
        end,
        desc = "Global search (includes hidden files)",
      },

      ------------------------------------------------------------------
      -- MAIN SEARCH: prompt for filetype (empty = all)
      ------------------------------------------------------------------

      {
        "<leader>sg",
        function()
          local ft = vim.fn.input("Filetype (empty = all): ")
          local lga = require("telescope").extensions.live_grep_args

          if ft == "" then
            lga.live_grep_args({
              additional_args = function()
                return { "--hidden", "--glob", "!.git/*" }
              end,
            })
          else
            lga.live_grep_args({
              additional_args = function()
                return { "--hidden", "--glob", "!.git/*", "-t", ft }
              end,
            })
          end
        end,
        mode = "n",
        desc = "Search by text (optional filetype filter)",
      },

      ------------------------------------------------------------------
      -- SEARCH WORD UNDER CURSOR
      ------------------------------------------------------------------

      {
        "<leader>sw",
        function()
          local word = vim.fn.expand("<cword>")
          require("telescope").extensions.live_grep_args.live_grep_args({
            default_text = word,
            additional_args = function()
              return { "--hidden", "--glob", "!.git/*" }
            end,
          })
        end,
        desc = "Search word under cursor",
      },

      ------------------------------------------------------------------
      -- PICK FILETYPE FROM A DROPDOWN BEFORE SEARCHING
      ------------------------------------------------------------------

      {
        "<leader>sF",
        function()
          local filetypes = {
            "lua",
            "javascript",
            "typescript",
            "tsx",
            "jsx",
            "ruby",
            "python",
            "json",
            "html",
            "css",
            "scss",
            "yaml",
          }

          vim.ui.select(filetypes, { prompt = "Choose filetype:" }, function(ft)
            if not ft then
              return
            end
            require("telescope").extensions.live_grep_args.live_grep_args({
              additional_args = function()
                return { "--hidden", "--glob", "!.git/*", "-t", ft }
              end,
            })
          end)
        end,
        desc = "Search with selectable filetype",
      },
    },
  },
}
