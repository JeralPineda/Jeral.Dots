return {
  "ziontee113/color-picker.nvim",
  config = function()
    local opts = { noremap = true, silent = true }


    require("color-picker").setup({ -- for changing icons & mappings
      -- ["icons"] = { "ﱢ", "" },
      -- ["icons"] = { "ﮊ", "" },
      -- ["icons"] = { "", "ﰕ" },
      ["icons"] = { "", "" },
      -- ["icons"] = { "", "" },
      -- ["icons"] = { "ﱢ", "" },
      ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
      ["keymap"] = {     -- mapping example:
        ["U"] = "<Plug>ColorPickerSlider5Decrease",
        ["O"] = "<Plug>ColorPickerSlider5Increase",
      },
      ["background_highlight_group"] = "Normal", -- default
      ["border_highlight_group"] = "FloatBorder", -- default
      ["text_highlight_group"] = "Normal",   --default
    })

    
    vim.keymap.set("n", "<C-p>", "<cmd>PickColor<cr>", opts)
    vim.keymap.set("i", "<C-p>", "<cmd>PickColorInsert<cr>", opts)
    vim.keymap.set("n", "C-P", "<cmd>PickColor close<cr>", opts)
    vim.keymap.set("i", "C-P", "<cmd>PickColor close<cr>", opts)

    vim.keymap.set("n", "<leader>pr", "<cmd>ConvertHEXandRGB<cr>", opts)
    vim.keymap.set("n", "<leader>ph", "<cmd>ConvertHEXandHSL<cr>", opts)

    vim.cmd([[hi FloatBorder guibg=NONE]]) -- if you don't want weird border background colors around the popup.
  end,
}
