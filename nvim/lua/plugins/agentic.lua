return {
  "carlos-algms/agentic.nvim",
  opts = {
    provider = "cursor-acp",
  },
  keys = {
    {
      "<leader-S-A>",
      function()
        require("agentic").toggle()
      end,
      mode = { "n", "v", "i" },
      desc = "Toggle Agentic Chat",
    },
  },
}
