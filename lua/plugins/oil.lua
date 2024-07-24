return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
       float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 150,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- preview_split: Split direction: "auto", "left", "right", "above", "below".
        preview_split = "auto",
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
    })
    vim.keymap.set("n", "-", oil.toggle_float, {desc = "Open oil file system"})
  end,
}