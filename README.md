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
- **c** (Code): LSP and code actions.
- **x** (Fix): Diagnostics and errors.
- **g** (Go): Navigation to views or tools.
- **f** (Find): Find files.
- **s** (Search): Search text.
- **m** (Mark): Mark buffers.
- **l** (List): List objects.

**Objects:**
- **p** (Project): Entire project.
- **g** (Git): Git management.
- **b** (Buffer): Entire file.

### Code & LSP (`c`)
Intelligent actions on the code.

- `<leader>cd`: **C**ode **D**efinition (Go to definition)
- `<leader>cD`: **C**ode **D**eclaration (Go to declaration)
- `<leader>cR`: **C**ode **R**eferences (Show references)
- `<leader>cI`: **C**ode **I**mplementation (Show implementation)
- `<leader>ca`: **C**ode **A**ction (Show code actions)
- `<leader>cr`: **C**ode **R**ename (Rename symbol)
- `<leader>cf`: **C**ode **F**ormat (Format file)

### Knowledge (`k`)
Documentation and passive information.

- `K`: **K**now Documentation (Hover docs)
- `<leader>k`: **K**now Signature (Signature help)

### Fix / Diagnostics (`x`)
Error and warning management.

- `<leader>xx`: **F**ix Diagnostic (Show float diagnostic)
- `<leader>xn`: **F**ix **N**ext (Next diagnostic)
- `<leader>xN`: **F**ix **P**rev (Previous diagnostic)

### Navigation & Tools
Movement between projects and files.

- `<leader>gp`: **G**o **P**roject (File explorer / Oil)
- `<leader>gg`: **G**o **G**it (LazyGit)
- `<leader>fp`: **F**ind **P**roject (Find files)
- `<leader>sp`: **S**earch **P**roject (Search text / Grep)

### Harpoon
Quick navigation between frequent files.

- `<leader>mb`: **M**ark **B**uffer (Add file)
- `<leader>lb`: **L**ist **B**uffers (Quick menu)
- `<leader>1-9`: Go to file 1-9
- `<C-n>`: Harpoon Next (Fast cycle)
- `<C-p>`: Harpoon Prev (Fast cycle)

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

### Clipboard
System clipboard interaction.
- `<leader>y`: Copy to system clipboard (`"+y`)
- `<leader>p`: Paste from system clipboard (`"+p`)

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

## TODOs
- Investigate [nvim-mini](https://github.com/nvim-mini/mini.nvim) plugins and see how many of my currents plugins can be replaced by more minimalist plugins from mini.
- Make harpooned files appear as tabs.

## Thanks
To all the developers from neovim and its plugins to make this possible.

