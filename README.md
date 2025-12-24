# Neovim Config
Personal configuration for neovim, inspired by the [LazyVim](https://www.lazyvim.org/) configuration, but a lot more minimalist.

## Requirements
- [Neovim](https://neovim.io/) >= 0.11
- [Git](https://git-scm.com/)
- A [Nerd Font](https://www.nerdfonts.com/)
- [xclip](https://github.com/astrand/xclip)

### Optional
- [ripgrep](https://github.com/BurntSushi/ripgrep)

## Install
To install the configuration, clone this repository on `~/.config/nvim`.
```shell
git clone https://github.com/LuckJMG/Neovim-Config.git ~/.config/nvim
```
Then initialize nvim and wait for lazy.nvim to install the plugins.

## Structure
- `init.lua`: entry point of the configuration
- `lua/config/`: neovim lua config files
- `lua/config/options.lua`: neovim base configuration
- `lua/config/autocmds.lua`: autocmds initialization
- `lua/config/keymaps.lua`: personal keymaps
- `lua/config/lazy.lua`: [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager initialization
- `lua/plugins/`: plugin configuration, for more information see [Plugins](#Plugins)

## Key Mappings
Leader key: `<Space>`

### Navigation & Scrolling
- `H`: Go to start of line
- `L`: Go to end of line
- `<C-u>`: Centered up scroll
- `<C-d>`: Centered down scroll
- `n`: Centered next search result
- `N`: Centered previous search result

### File Navigation
- `<leader>v`: Open project view (Oil.nvim)
- `<leader><space>`: Find files (Telescope)
- `<leader>/`: Live grep (Telescope)

### Harpoon
- `<leader>H`: Harpoon file (Add to list)
- `<leader>h`: Toggle Harpoon quick menu
- `<leader>n`: Harpoon to next file
- `<leader>p`: Harpoon to prev file
- `<leader>1-9`: Select Harpoon file 1-9

### LSP & Coding
- `gd`: Go to Definition
- `gD`: Go to Declaration
- `gr`: Go to References
- `gI`: Go to Implementation
- `<leader>k`: Hover Documentation
- `<leader>K`: Signature Help
- `<leader>ca`: Code Action
- `<F2>`: Rename Symbol
- `<leader>f`: Format buffer
- `<leader>di`: Show Line Diagnostics
- `<leader>dn`: Next Diagnostic
- `<leader>dp`: Previous Diagnostic

### Editing & Selection
- `<` / `>`: Indent left/right maintaining selection (Visual)
- `K`: Move block up (Visual)
- `J`: Move block down (Visual)
- `U`: Redo

### Clipboard
- `<leader>y`: Copy to system clipboard (`+`)
- `<leader>Y`: Copy line to system clipboard (`+`)
- `<leader>P`: Paste from system clipboard
- `<C-v>`: Paste from system clipboard (Insert/Command)
- `<leader>ya`: Copy entire file as markdown block

### Git
- `<leader>g`: Open LazyGit

### System & Utilities
- `<C-s>`: Save file
- `<Esc>`: Clear highlight search
- `<leader>?`: Show Buffer Local Keymaps (Which-key)

## Plugins
### Auto-completion
Configuration file in `lua/plugins/cmp.lua`.

- [blink.nvim](https://github.com/saghen/blink.cmp) as main auto-completion plugin.

### Coding
Configuration file in `lua/plugins/coding.lua`.

- [nvim-lint](https://github.com/mfussenegger/nvim-lint) as main linter.
- [conform.nvim](https://github.com/stevearc/conform.nvim) as main formatter.
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) to auto close pairs.
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) for lazygit seamless integration.

### LSP
Configuration file in `lua/plugins/lsp.lua`.

- [lazydev.nvim](https://github.com/folke/lazydev.nvim) for developing neovim configurations.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) as main LSP configuration plugin.
- [mason](https://github.com/mason-org/mason.nvim) to manage all LSP.

### Navigation
Configuration file in `lua/plugins/navigation.lua`.

- [oil.nvim](https://github.com/stevearc/oil.nvim) for file tree managment.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for quick finding files in any project.
- [harpoon](https://github.com/ThePrimeagen/harpoon) for quick switching between files.

### Treesitter
Configuration file in `lua/plugins/treesittter.lua`.

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting.
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) for sticky context.
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) for intelligent tag editing.

### UI
Configuration file in `lua/plugins/ui.lua`.

- [everforest-nvim](https://github.com/neanias/everforest-nvim) main color scheme.
- [mini.icons](https://github.com/nvim-mini/mini.icons) for consistent icons.
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) for a modern status line.
- [noice.nvim](https://github.com/folke/noice.nvim) for a more aesthetic cmdline and notifications.
- [which-key](https://github.com/folke/which-key.nvim) in case I forgot some keymap.

## TODOs
- Investigate [nvim-mini](https://github.com/nvim-mini/mini.nvim) plugins and see how many of my currents plugins can be replaced by more minimalist plugins from mini.
- Standarize keymaps to use the common keymap language of vim motions.

## Thanks
To all the developers from neovim and its plugins to make this possible.

