# indent-textobject.nvim

This plugin provides a new textobject based on current indent scope, does not depend on treesitter

[![asciicast](https://asciinema.org/a/dXVsbKKeP8oBruQmpvrV4cZpR.svg)](https://asciinema.org/a/dXVsbKKeP8oBruQmpvrV4cZpR)


## Mappings

This code example shows how to map:

- `v ii` select inner indent
- `v ai` select inner indent with lines above/below
- `o ai` operator mapping
- `o ii` operator mapping
- `[i` move to first inner indent line
- `]i` move to last inner indent line
- `[I` move to first outer indent line 
- `]I` move to last outer indent line

```lua
vim.keymap.set("v", "ii", require("indent-textobject").select_inner)
vim.keymap.set("v", "ai", require("indent-textobject").select_around)

vim.keymap.set("o", "ii", "<cmd>normal vii<cr>")
vim.keymap.set("o", "ai", "<cmd>normal vai<cr>")

vim.keymap.set({ "n", "v" }, "[i", require("indent-textobject").goto_inner_top)
vim.keymap.set({ "n", "v" }, "]i", require("indent-textobject").goto_inner_bot)

vim.keymap.set({ "n", "v" }, "[I", require("indent-textobject").goto_around_top)
vim.keymap.set({ "n", "v" }, "]I", require("indent-textobject").goto_around_bot)
```

## Api

```
function select_inner()
function select_around()
function goto_inner_top()
function goto_inner_bot()
function goto_around_top()
function goto_around_bot()
```
