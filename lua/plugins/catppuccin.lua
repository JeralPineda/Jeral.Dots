return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        color_overrides = {
          all = {},
          latte = {},
          frappe = {},
          macchiato = {},
          mocha = {
            --base = "#15141f",
          },
        },
      })

      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
