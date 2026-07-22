return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    opts = function(_, opts)
      local lga_actions = require("telescope-live-grep-args.actions")

      -- Always show hidden files
      opts.defaults = opts.defaults or {}
      opts.defaults.hidden = true

      -- live_grep_args config (manual merge, no vim helpers)
      opts.extensions = opts.extensions or {}
      opts.extensions.live_grep_args = opts.extensions.live_grep_args or {}

      opts.extensions.live_grep_args.auto_quoting = true
      opts.extensions.live_grep_args.additional_args = function()
        return { "--hidden" }
      end

      opts.extensions.live_grep_args.mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      }
    end,
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
  },
}
