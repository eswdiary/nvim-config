## Requirements

- Tree-sitter CLI
- ripgrep


## Custom Shortcut

### Nvim

- `<M-w>`: Close current buffer
- `<M-r>`: Vertical split
- `<M-h / l>`: Move cursor focus on left / right split window

#### Lsp

- `<leader>gd`: Jump to defination
- `<leader>ff`: Formatting (`vim.lsp.buf.format`)
- `<leader>ca`: Code actions
- `<leader>d`: Dianogstics

### Telescope

- `<M-o>`: Open file……
- `<M-b>`: Search buffer
- `<M-f>`: Find
- `<M-S-f>`: Live grep in current directory
- `<M-d>`: Dianogstics

### Neotree

- `<space>`: Open tree
- `<L>:` Focus preview
- `<l>`: Open file / folder
- `<P>`: Toggle preview
- `<h>`: Previous directory
- `<C>`: Toggle expand / collapse directory

### Mini.nvim

- `<gS>`: MINI.SPITJOIN => toggle
- `<sa>`: MINI.SURROUND => add surround
- `<sd>`: MINI.SURROUND => delete surround

### Supercollider

- `<leader>se`: Eval line
- `<leader>ee`: Eval block
- <leader>ss: Sclang start
- <leader>sr: Sclang recompile

Add following line to the buttom of `scnvim_snippets.lua` otherwise cmp for class will not work.

```lua
ls.add_snippets("supercollider", snippets)
```


