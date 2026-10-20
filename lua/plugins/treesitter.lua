return {

	-- Treesitter.nvim
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",

	-- 設定 Treesitter.nvim
	config = function()
		require("nvim-treesitter").install({
			"lua",
			"python",
			"javascript",
			"css",
			"html",
			"supercollider",
			"rust",
			"vim",
			"vimdoc",
		})
	end,
}
