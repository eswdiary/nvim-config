return {
	-- 自動安裝LSP 並預設自啟動
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			-- 社群的設定檔
			"neovim/nvim-lspconfig",
		},
	},
	{
		-- 額外的 formatter 設定，直接預設該語言所使用的 formatter，避免衝突
		"stevearc/conform.nvim",
		opts = {},

		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
				},
			})
		end,
	},
	{
		-- For Rust --
		"mrcjkb/rustaceanvim",
		version = "^9", -- Recommended
		lazy = false, -- This plugin is already lazy
	},
	{
		-- For pretty diagnostics
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup({
				-- Choose a preset style for diagnostic appearance
				-- Available: "modern", "classic", "minimal", "powerline", "ghost", "simple", "nonerdfont", "amongus"
				preset = "modern",
				options = {
					add_messages = {
						display_count = true,
					},
					multilines = {
						enabled = true,
					},
				},
			})
			vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
		end,
	},
}
