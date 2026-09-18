return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<C-n>", function()
			require("neo-tree.command").execute({ action = "focus", source = "filesystem", position = "left", toggle = true, reveal = true })
		end, { desc = "neo-tree: toggle file explorer" })
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { desc = "neo-tree: buffer list (float)" })
	end,
}
