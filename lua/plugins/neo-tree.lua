return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_into_hidden = enabled,
				follow_current_files = enabled,
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
				},
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem<CR>", {})
	end,
}
