return {
  "danymat/neogen",
  cmd = "Neogen",
  config = true,
  keys = {
    {
      "<leader>cn",
      function()
        require("neogen").generate()
      end,
      desc = "Generate Annotations (Neogen)",
    },
  },
}