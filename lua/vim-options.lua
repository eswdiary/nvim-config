---@diagnostic disable: undefined-global
-- nvim --
vim.cmd("set expandtab") -- 將 tab 鍵轉換為空格
vim.cmd("set tabstop=4") -- tab 字元在文件中顯示的寬度，僅影響顯示效果
vim.cmd("set softtabstop=4") -- tab 鍵插入的空格數
vim.cmd("set shiftwidth=4") -- 使用 << 或 >> 所縮排的空格
vim.cmd("set nowrap") -- 超過不換行
vim.opt.signcolumn = "yes" -- diagnostic 不會突然影響畫面移動

-- zen / ink / mist
vim.cmd("colorscheme kanso-ink")

vim.opt.termguicolors = true -- 啟用顏色

vim.opt.swapfile = false -- 禁用 swap file

vim.opt.conceallevel = 2 -- 收合 markdown 語法的 link

-- vim.api.nvim_set_option("clipboard", "unnamedplus")     -- 打通系統 clipboard，wayland 需裝 wl-clipboard
vim.wo.number = true -- 顯示行號
vim.wo.relativenumber = true --顯示相對行號

vim.wo.cursorline = true -- 水平高亮
vim.wo.cursorcolumn = true -- 垂直高亮

-- folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.lsp.foldexpr()" -- 內建 LSP folding
vim.o.foldcolumn = "1"

vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Buffer --
local keymap = vim.keymap

-- silent
-- 當你按下快捷鍵時，底部的命令列不會彈出執行指令的文字

keymap.set("n", "<leader>l", ":bnext<CR>") -- 切換 Buffer
keymap.set("n", "<leader>h", ":bprevious<CR>")

keymap.set("n", "<M-w>", ":bd<CR>", { silent = true }) -- 關閉 Buffer 而不是整個 nvim
keymap.set("n", "<M-r>", ":vsp<CR>", { silent = true }) -- 垂直分割
keymap.set("n", "<Ms-r>", ":sp<CR>", { silent = true }) -- 水平分割
keymap.set("n", "<M-l>", "<C-w>l", { silent = true }) -- 垂直分割（向右移動）
keymap.set("n", "<M-h>", "<C-w>h", { silent = true }) -- 垂直分割（向左移動）
keymap.set("n", "<M-j>", "<C-w>j", { silent = true }) -- 水平分割（向下移動）
keymap.set("n", "<M-k>", "<C-w>k", { silent = true }) -- 水平分割（向上移動）

keymap.set("n", "<M-e>", ":Neotree source=filesystem reveal=true position=float toggle=true<CR>") -- neotree
-- postition = left, right, top, bottom, float, current

-- Plugins --
vim.opt.termguicolors = true -- Bufferline 文檔要求

-- LSP --
-- 260529 mason.lspconfig 已預設自啟動
-- vim.lsp.enable("lua_ls")
-- vim.lsp.enable("rust_analyzer")

-- Format 不應該綁定 LspAttach
keymap.set("n", "<leader>ff", function()
	require("conform").format({
		lsp_fallback = true, -- 如果找不到對應的 formatter，才退回使用 LSP 的格式化
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format buffer" })

-- Format / Diagnostic / Code actions --
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	pattern = "*",

	callback = function(args)
		local opts = { buffer = args.buf, silent = true }

		opts.desc = "Diagnostic open float"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "LSP GoTo Definition"
		keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)

		opts.desc = "LSP buf code action"
		keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "LSP rename"
		keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

		opts.desc = "Toggle inlay [H]ints"
		keymap.set("n", "<leader>ih", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, opts)

		opts.desc = "Run current main/test"
		keymap.set("n", "<leader>rc", function()
			vim.cmd.RustLsp("runnables")
		end, opts)
	end,
})

-- Treesitter --
-- 251222:
-- 現在 syntax highlight 似乎只要有 parse file 就可以用內建的 vim.treesitter 達成
-- treesitter.nvim 變成 manager 的功能

-- scd = supercollider
vim.filetype.add({
	extension = { scd = "supercollider" },
})

-- 針對 SC 做 folding 的設置
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "supercollider" },
	callback = function()
		vim.o.foldmethod = "manual"
		-- 似乎還是沒辦法用 expr fold？
		-- vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		-- vim.wo[0][0].foldmethod = "expr"
		vim.lsp.start({
			name = "sclang-lint",
			cmd = { "sclang-lint-server" },
		})
	end,
})
