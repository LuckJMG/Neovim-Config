# Neovim Config
Personal configuration for neovim.

## Requirements
- Neovim >= 0.11
- Git
- A [Nerd Font](https://www.nerdfonts.com/)
- `xclip`

### Optional
- `ripgrep`

## Install
To install the configuration, clone this repository on `~/.config/nvim`.
```shell
git clone https://github.com/LuckJMG/Neovim-Config.git ~/.config/nvim
```
Then initialize nvim and wait for lazy.nvim to install the plugins.

## Structure
- `init.lua`: entry point
- `lazy.lua`: [lazy.nvim](https://github.com/folke/lazy.nvim) package manager setup
- `options.lua`: nvim options
- `keymaps.lua`: nvim keymaps
- `ui.lua`: UI customizations
- `plugins/`: plugin configurations

## Key Mappings
Leader key: `<Space>`

### Navigation
- `H`: Move to start of line
- `L`: Move to end of line
- `<C-j>`: Page down (centered)
- `<C-k>`: Page up (centered)
- `<Alt-j>`: Jump to end of file
- `<Alt-k>`: Jump to start of file
- `n` / `N`: Next/previous search (centered)

### File Navigation
- `<leader>pv`: File explorer
- `<leader>pf`: Find files (Telescope)
- `<leader>pg`: Live grep (Telescope)
- `<leader>pb`: Buffers (Telescope)
- `<leader>ps`: Symbols (Telescope)
- `<leader>gf`: Git files (Telescope)

### Harpoon
- `<leader>m`: Mark file
- `<leader>pm`: Toggle Harpoon menu
- `<C-n>`: Next marked file
- `<C-p>`: Previous marked file

### Clipboard
- `<C-c>`: Copy to system clipboard (visual)
- `<C-v>`: Paste from system clipboard
- `<leader>ya`: Yank entire file to clipboard
- `U`: Redo

### LSP
- `<leader>k`: Hover documentation
- `gd`: Go to definition
- `<F2>`: Rename symbol
- `<leader>ca`: Code actions
- `<leader>di`: Show diagnostics
- `<leader>dn`: Next diagnostic
- `<leader>dp`: Previous diagnostic

### Git (Fugitive)
- `<leader>gs`: Git status
- `<leader>gp`: Git push

## Plugins
- **LSP**: Native LSP with Mason
- **Completion**: nvim-cmp + LuaSnip
- **Syntax**: Treesitter
- **Fuzzy Finder**: Telescope
- **Git**: Fugitive
- **Navigation**: Harpoon
- **Auto-pairs**: nvim-autopairs
- **Theme**: Dracula
- **Statusline**: Lualine

