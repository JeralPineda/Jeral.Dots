return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tailwindcss = {},
			},
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
	},
  -- {
  --   "roobert/tailwindcss-colorizer-cmp.nvim",
  --   -- optionally, override the default options:
  --   config = function()
  --     require("tailwindcss-colorizer-cmp").setup({
  --       --color_square_width = 2,
  --       rgba = true,
  --     })
  --  end
  -- },
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = function()
			require("tailwind-tools").setup({})

			-- set keymaps
      local keymap = vim.keymap -- for conciseness

      keymap.set("n", "<leader>tb", "<cmd>TailwindConcealToggle<cr>", { desc = "Toggles conceal class" })

      keymap.set("n", "<leader>tg", "<cmd>TailwindColorToggle<cr>", { desc = "Toggles color hints" })

      keymap.set("n", "<leader>ts", "<cmd>TailwindSort<cr>", { desc = "Sorts all classes in the current buffer" })

			 keymap.set("n", "<leader>nc", "<cmd>TailwindNextClass<cr>", { desc = "Moves the cursor to the nearest next class node." })

      keymap.set("n", "<leader>pc", "<cmd>TailwindPrevClass<cr>", { desc = "Moves the cursor to the nearest previous class node." })

		end,
	}
}
