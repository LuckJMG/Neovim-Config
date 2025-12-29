# Neovim Config
Personal configuration for neovim, started with [Vim As Your Editor](https://www.youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R) by ThePrimeagen and branched forward.

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
Inspired by the [LazyVim](https://www.lazyvim.org/) structure.
- `init.lua`: entry point of the configuration
- `lua/config/`: neovim lua config files
- `lua/config/options.lua`: neovim base configuration
- `lua/config/autocmds.lua`: autocmds initialization
- `lua/config/keymaps.lua`: personal keymaps
- `lua/config/lazy.lua`: [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager initialization
- `lua/plugins/`: plugin configuration, for more information see [Plugins](#Plugins)

## Key Mappings
Leader key: `<Space>`

Keymaps intend to follow the Vim grammar, inspired by the talk [Mastering the Vim Language](https://www.youtube.com/watch?v=wlR5gYd6um0) by Chris Toomey.

### Grammar (Verb + Object)
The configuration follows a semantic structure to aid muscle memory.

**Verbs:**
- **c** (Code): Actions that modify or inspect code (Rename, Format, Actions).
- **f** (Find): Find files by name.
- **g** (Go): Navigation (Standard Vim + Extended Global actions).
- **k** (Know): Documentation and Signatures.
- **l** (List): List objects.
- **m** (Mark): Mark buffers.
- **s** (Search): Search text content.

**Objects:**
- **b** (Buffer): Entire file.
- **g** (Git): Git management.
- **p** (Project): Entire project directory.

### Code & LSP (`c` & `g`)
Intelligent actions on the code. `g` is used for navigation, `c` for modification/info.

- `gd`: **G**o **D**efinition
- `gD`: **G**o **D**eclaration
- `gr`: **G**o **R**eferences
- `gi`: **G**o **I**mplementation
- `<leader>ca`: **C**ode **A**ction (Execute code actions)
- `<leader>cr`: **C**ode **R**ename (Rename symbol)
- `<leader>cf`: **C**ode **F**ormat (Format file)
- `<leader>cd`: **C**ode **D**iagnostic (Show float diagnostic)

### Knowledge (`k`)
Documentation and passive information.

- `<leader>k`: **K**now Signature (Signature help)

### Navigation & Tools (`g`, `f`, `s`)
Movement between projects, files, and tools.

- `<leader>gg`: **G**o **G**it (LazyGit)
- `-`: Open Parent Directory (Oil)
- `<leader>fp`: **F**ind **P**roject (Find files)
- `<leader>sp`: **S**earch **P**roject (Search text / Grep)

### Harpoon (`m`, `l`)
Quick navigation between frequent files.

- `<leader>mb`: **M**ark **B**uffer (Add file)
- `<leader>lb`: **L**ist **B**uffers (Quick menu)
- `<C-n>`: Harpoon Next (Fast cycle)
- `<C-p>`: Harpoon Prev (Fast cycle)
- `<leader>1-9`: Go to file 1-9

### Clipboard (`g`)
System clipboard interaction using the global operator `g`.

- `gy`: **G**lobal **Y**ank (Copy to system clipboard `"+y`)
- `gp`: **G**lobal **P**aste (Paste from system clipboard `"+p`)
- `gyab`: **G**lobal **Y**ank **A**round **B**uffer (Copy file as Markdown block)

### Basic Movement & Edit
Quality of life improvements.

- `H`: Go to start of line (`^`)
- `L`: Go to end of line (`$`)
- `<C-u>` / `<C-d>`: Centered up/down scroll
- `n` / `N`: Next/Previous search result (centered)
- `<` / `>`: Indent left/right maintaining selection
- `U`: Redo
- `<C-s>`: Save file
- `<Esc>`: Clear search highlight (`nohlsearch`)

## Plugins
Tried to use [nvim-mini](https://nvim-mini.org/mini.nvim/) by Evgeni Chasnovski, framework as a base/default.

### Auto-completion
Configuration file in `lua/plugins/cmp.lua`.

- [blink.nvim](https://github.com/saghen/blink.cmp) as main auto-completion plugin.

### Coding
Configuration file in `lua/plugins/coding.lua`.

- [conform.nvim](https://github.com/stevearc/conform.nvim) as main formatter.
- [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) for lazygit seamless integration.
- [mini.pairs](https://nvim-mini.org/mini.nvim/readmes/mini-pairs.html) for auto pairing.
- [mini.splitjoin](https://nvim-mini.org/mini.nvim/readmes/mini-splitjoin.html) for intelligent joining.
- [mini.operators](https://nvim-mini.org/mini.nvim/readmes/mini-operators.html) for sorting lines.
- [nvim-lint](https://github.com/mfussenegger/nvim-lint) as main linter.

### LSP
Configuration file in `lua/plugins/lsp.lua`.

- [lazydev.nvim](https://github.com/folke/lazydev.nvim) for developing neovim configurations.
- [mason](https://github.com/mason-org/mason.nvim) to manage all LSP.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) as main LSP configuration plugin.

### Navigation
Configuration file in `lua/plugins/navigation.lua`.

- [harpoon](https://github.com/ThePrimeagen/harpoon) for quick switching between files.
- [oil.nvim](https://github.com/stevearc/oil.nvim) for file tree managment.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for quick finding files in any project.

### Treesitter
Configuration file in `lua/plugins/treesittter.lua`.

- [mini.ai](https://nvim-mini.org/mini.nvim/readmes/mini-ai.html) for more text objects.
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) for sticky context.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting.
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) for intelligent tag editing.

### UI
Configuration file in `lua/plugins/ui.lua`.

- [everforest-nvim](https://github.com/neanias/everforest-nvim) color main scheme.
- [harpoon-tabline](https://github.com/jasonpanosso/harpoon-tabline.nvim) for a graphic reminder of harpooned files.
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) for a modern status line.
- [mini.icons](https://github.com/nvim-mini/mini.icons) for consistent icons.
- [noice.nvim](https://github.com/folke/noice.nvim) for a more aesthetic cmdline and notifications.

## Thanks
To all the developers from neovim and its plugins to make this possible.

