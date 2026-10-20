return {
	{
		"davidgranstrom/scnvim",

		config = function() local scnvim = require("scnvim") local map = scnvim.map
			local map_expr = scnvim.map_expr

			scnvim.setup({
				keymaps = { ["<leader>se"] = map("editor.send_line", { "n" }),
					["<leader>ee"] = {
						map("editor.send_block", { "n" }),
						map("editor.send_selection", "x"),
					},
					-- ["<M-p>"] = map("postwin.toggle"),
					-- ["<M-S-P>"] = map("postwin.clear", { "n", "i" }),
					["<M-.>"] = map("sclang.hard_stop", { "n", "x", "i" }),
					["<leader>ss"] = map("sclang.start"),
					-- ['<C-k>'] = map('signature.show', {'n', 'i'}),
					["<leader>sr"] = map("sclang.recompile"),
					-- ["<F5>"] = map_expr("s.boot", { "n" }),
					-- ["<F6>"] = map_expr("s.meter"),
				},

				editor = {
					highlight = {
						color = "IncSearch", -- IncSearch, TermCursor
						type = "flash", -- flash, fade
					},
				},

				postwin = {
					float = {
						enabled = false,
					},
				},

				snippet = {
					engine = {
						name = "luasnip",
						options = { descriptions = true },
					},
				},
			})
            -- tmux
            scnvim.load_extension 'tmux'
		end,
	},
    { 'davidgranstrom/scnvim-tmux' },
	-- API 問題已經無法使用
	-- 自修改後 indent 問題沒有得到解決，工程過多
	-- {
	-- 	"madskjeldgaard/sclang-format.nvim",
	-- 	requires = "nvim-treesitter/nvim-treesitter",
	-- 	config = function()
	-- 		require("sclang-format").setup()
	-- 	end,
	-- },
	-- Strudel nvim
    -- Strudel 的設計上無法解決 Browser 自帶的 GC 的問題，無法長時間使用
	-- {
	-- 	"gruvw/strudel.nvim",
	-- 	build = "npm ci",
	-- 	config = function()
	-- 		local strudel = require("strudel")
	-- 		strudel.setup({
	-- 			custom_css_file = "/Volumes/1TB/Music/Strudel/hide-code.css",
	-- 		})
	-- 		vim.keymap.set("n", "<leader>ss", strudel.launch, { desc = "Launch Strudel" })
	--            vim.keymap.set("n", "<leader>se", strudel.update, { desc = "Strudel Update" })
	--            vim.keymap.set("n", "<C-.>", strudel.toggle, { desc = "Strudel Toggle Play/Stop" })
	-- 	end,
	-- },
}
