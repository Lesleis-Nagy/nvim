# Neovim Shortcuts — Cheatsheet (from your config)

> Leader key: **Space** (`<leader>` = `␣`)  
> Alt key: **`<M-…>`** (Option on macOS)  
> Ctrl key: **`<C-…>`**

---

## Telescope (fuzzy finding)
| Keys | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (needs `ripgrep`) |
| `<leader>fb` | List open buffers |
| `<leader>fh` | Help tags |

---

## LSP (Language Server Protocol)
These are active in buffers where a language server is attached.

| Keys | Action |
|---|---|
| `gd` | Go to definition |
| `gr` | Find references |
| `K`  | Hover documentation |
| `<leader>rn` | **Rename** symbol |
| `<leader>ca` | **Code action** |
| `gI` | Go to implementation |
| `<leader>f` | **Format** buffer (async) |
| `<leader>e` | Hover over error additional information

> Python uses **basedpyright** and **ruff**; C/C++ uses **clangd**.

---

## Formatting (C/C++/ObjC/ObjC++)
You’ve set `equalprg=clang-format -style=file` for C-family filetypes, so the **`=` operator** runs `clang-format`.

- **Whole buffer:** `gg=G`  
- **Selection:** visually select, then press `=`  
- **LSP format:** `<leader>f` (calls server formatting, clangd uses `clang-format` too)

> Put a `.clang-format` at the repo root to control style.

---

## NERDTree
| Keys | Action |
|---|---|
| `<leader>ti` | Toggle ignore patterns (`_build`, `node_modules`) and refresh tree |

> Command to open the tree (if needed): `:NERDTree`

---

## ToggleTerm (terminal inside Neovim)
| Keys | Action |
|---|---|
| `<C-\>` | Toggle terminal (size = 20 rows) |

---

## Debugging (nvim-dap + dap-ui)
| Keys | Action |
|---|---|
| `<M-c>` | Continue / Start debug session |
| `<M-n>` | Step over |
| `<M-i>` | Step into |
| `<M-o>` | Step out |
| `<M-b>` | Toggle breakpoint |

> dap-ui opens automatically on start and closes when the session ends.

---

## Quality-of-life / UI (from your options)
- Mouse enabled: drag selections, resize splits (`:set mouse=a`)
- System clipboard integrated (`unnamedplus`) — use `y`/`p` normally to copy/paste with OS clipboard
- Line numbers, match brackets, 100-column ruler, smartcase search
- Tabs → spaces; `shiftwidth=2`, `tabstop=2`, `smartindent`

---

## Plugins Installed (highlights)
Dracula / Gruvbox / Tokyo Night / Aura / Nightfox / Moonfly themes · Nerdtree ·
Startify · Treesitter · Telescope · Lualine · Toggleterm · Conform · Mason (+mason-lspconfig) ·
nvim-lspconfig · nvim-dap (+dap-ui +virtual-text)

---

### Notes
- LSP keymaps are buffer-local; they appear when a server attaches (`:LspInfo` to check).  
- Ruff’s hover is disabled so Python hovers come from basedpyright.  
- Clangd is launched with background indexing and clang-tidy enabled.  
- If a key doesn’t respond, ensure the relevant plugin is installed/loaded and the filetype matches.
