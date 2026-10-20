return {
	{
		"echasnovski/mini.nvim",
		version = false,

		config = function()
			-- 自動括號補全
			require("mini.pairs").setup()

			-- 縮排
			require("mini.indentscope").setup({
				draw = {
					animation = require("mini.indentscope").gen_animation.none(),
				},
			})

			-- 自動包覆
			require("mini.surround").setup({
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					update_n_lines = "sn", -- Update `n_lines`

					suffix_last = "l", -- Suffix to search with 'prev' method
					suffix_next = "n", -- Suffix to search with 'next' method
				},
			})

			-- 拆分
			require("mini.splitjoin").setup()

			-- 主題
			-- Tomorrow Night
			-- require("mini.base16").setup({
			-- 	palette = {
			-- 		base00 = "#1d1f21",
			-- 		base01 = "#282a2e",
			-- 		base02 = "#373b41",
			-- 		base03 = "#969896",
			-- 		base04 = "#b4b7b4",
			-- 		base05 = "#c5c8c6",
			-- 		base06 = "#e0e0e0",
			-- 		base07 = "#ffffff",
			-- 		base08 = "#cc6666",
			-- 		base09 = "#de935f",
			-- 		base0A = "#f0c674",
			-- 		base0B = "#b5bd68",
			-- 		base0C = "#8abeb7",
			-- 		base0D = "#81a2be",
			-- 		base0E = "#b294bb",
			-- 		base0F = "#a3685a",
			-- 	},
			-- 	use_cterm = true,
			-- 	plugins = {
			-- 		default = false,
			-- 		["nvim-mini/mini.nvim"] = true,
			-- 	},
			-- })

			-- Tab
			require("mini.tabline").setup()
			-- Jump
			require("mini.jump").setup()
			-- Highlight
			require("mini.hipatterns").setup({
				highlighters = {
					fixme = { pattern = "FIXME", group = "MiniHipatternsFixme" },
					hack = { pattern = "HACK", group = "MiniHipatternsHack" },
					test = { pattern = "TEST", group = "MiniHipatternsHack" },
					todo = { pattern = "TODO", group = "MiniHipatternsTodo" },
					note = { pattern = "NOTE", group = "MiniHipatternsNote" },
					debug = { pattern = "DEBUG", group = "MiniHipatternsNote" },
				},
			})
		end,
	},
}
