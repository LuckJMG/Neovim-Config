# Neovim Config

Personal configuration for neovim, started with [Vim As Your Editor](https://www.youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R) by ThePrimeagen and based in [You Don't Need Plugins: A NeoVim Config for Minimalists](https://www.youtube.com/watch?v=skW3clVG5Fo).

## Requirements

- [Neovim](https://neovim.io/) >= 0.11
- [Git](https://git-scm.com/)
- A [Nerd Font](https://www.nerdfonts.com/)

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
- `lua/plugins/`: plugin configuration, for more information see [Plugins](#Plugins)

## Key Mappings

Leader key: `<SPACE>`

Keymaps intend to follow the Vim grammar, inspired by the talk [Mastering the Vim Language](https://www.youtube.com/watch?v=wlR5gYd6um0) by Chris Toomey. The style of description comes from [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim)

There are 2 kinds:
- Mnemotecnics with `<LEADER>` or `g`, intended to follow the vim grammar.
- Shortcuts with `<CTRL>` or `<FN>`, intended to speed up use.

### Base

Quality of life keymaps.

- `U`: Redo
- `gy`: **[Y]**ank to System Clipboard
- `gp`: **[P]**aste from System Clipboard
- `gyaB`: **[Y]**ank **[A]** **[B]**uffer (Copy buffer with context)
- `<LEADER>d`: Show **[D]**iagnostic
- `<F5>`: Run Justfile
- `<C-s>`: Save file

### Code

Intelligent actions on the code.

- `<LEADER>cd`: **[C]**ode **[D]**efinition
- `<LEADER>cD`: **[C]**ode **[D]**eclaration
- `<LEADER>cR`: **[C]**ode **[R]**eferences
- `<LEADER>ci`: **[C]**ode **[I]**mplementation
- `<LEADER>ca`: **[C]**ode **[A]**ction
- `<LEADER>cr` or `<F2>`: **[C]**ode **[R]**ename
- `<LEADER>cf`: **[C]**ode **[F]**ormat
- `<LEADER>a`: **[A]I** Toggle

### Navigation

Movement between projects, files, and tools.

- `-`: Open Parent Directory (Oil)
- `<LEADER>sf`: **[S]**earch **[F]**iles
- `<LEADER>sg`: **[S]**earch by **[G]**rep
- `<LEADER>sh`: **[S]**earch **[H]**elp
- `<LEADER>sk`: **[S]**earch **[K]**eymaps
- `<LEADER>m`: **M**ark Buffer
- `<LEADER>M`: **M**arked Buffers List
- `<LEADER>1-9`: Go to file 1-9

## Plugins

Tried to use [nvim-mini](https://nvim-mini.org/mini.nvim/) by Evgeni Chasnovski, framework as a base/default. [mini.deps](https://nvim-mini.org/mini.nvim/readmes/mini-deps) is the package manager for easy transition to nvim-0.12.

### Languages

Configuration file in `lua/plugins/langs.lua`.

- [mason](https://github.com/mason-org/mason.nvim) to manage all LSP.
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) as main LSP configuration plugin.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for better syntax highlighting.
- [conform.nvim](https://github.com/stevearc/conform.nvim) as formatter manager.

### UI

Configuration file in `lua/plugins/ui.lua`.

- [everforest-nvim](https://github.com/neanias/everforest-nvim) color main scheme.
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) for a modern status line.
- [mini.icons](https://github.com/nvim-mini/mini.icons) for consistent icons.
- [noice.nvim](https://github.com/folke/noice.nvim) for a better CMD.
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) for sticky context.
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) for indentation markup.

### Navigation

Configuration file in `lua/plugins/navigation.lua`.

- [harpoon](https://github.com/ThePrimeagen/harpoon) for quick switching between files.
- [oil.nvim](https://github.com/stevearc/oil.nvim) for file tree managment.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for quick finding files in any project.

### Coding

Configuration file in `lua/plugins/coding.lua`.

- [blink.nvim](https://github.com/saghen/blink.cmp) as main auto-completion plugin.
- [conform.nvim](https://github.com/stevearc/conform.nvim) as main formatter.
- [copilot.lua](https://github.com/zbirenbaum/copilot.lua) as main AI smart completion.
- [guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim) for automatic indentation detection.
- [mini.ai](https://nvim-mini.org/mini.nvim/readmes/mini-ai.html) for more text objects.
- [mini.comment](https://nvim-mini.org/mini.nvim/readmes/mini-comment.html) for comment action and text object.
- [mini.pairs](https://nvim-mini.org/mini.nvim/readmes/mini-pairs.html) for auto pairing.
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) for intelligent tag editing.

## TODO

- Change [guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim) and [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) for a local implementation.
- Check [99](https://github.com/ThePrimeagen/99) plugin.

## Guidelines

1. One full review per semester, between reviews only major bugs will be fixed, other minor things will be added to the TODO for the next review.
2. Minimize external dependencies.
3. Don't steal focus of the developer.
4. Be an extension of vim, not a full replacement.

## Thanks

To all the developers from neovim and its plugins to make this possible.
