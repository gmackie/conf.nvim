# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration based on kickstart.nvim, using lazy.nvim as the plugin manager. The configuration is structured in Lua and emphasizes LSP integration, fuzzy finding, and modern text editing features.

## Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point - loads all modules
├── lazy-lock.json             # Plugin version lock file
└── lua/
    ├── user/                  # User configuration modules
    │   ├── settings.lua       # Vim options and settings
    │   ├── keymaps.lua        # Global key mappings
    │   ├── commands.lua       # Autocommands (e.g., highlight on yank)
    │   └── plugin.lua         # Lazy.nvim bootstrap and simple plugins
    └── plugins/               # Plugin-specific configurations
        ├── init.lua           # Simple plugins (vim-sleuth, open-in-obsidian)
        ├── lsp.lua            # LSP configuration with Mason
        ├── telescope.lua      # Fuzzy finder setup
        ├── cmp.lua            # Autocompletion
        ├── conform.lua        # Code formatting
        ├── treesitter.lua     # Syntax highlighting
        ├── gitsigns.lua       # Git integration
        ├── harpoon.lua        # Quick file navigation
        ├── which-key.lua      # Key binding hints
        ├── catpuccin.lua      # Color scheme
        └── [other plugins]
```

## Key Architecture Decisions

### Plugin Management
- Uses lazy.nvim for plugin management with lazy loading
- Plugin configurations are modularized in `lua/plugins/` directory
- Each plugin file returns a table that lazy.nvim processes
- The `require("lazy").setup("plugins")` in `lua/user/plugin.lua` automatically loads all files from the plugins directory

### LSP Setup Flow
1. Mason installs LSP servers, formatters, and linters
2. mason-lspconfig bridges Mason and nvim-lspconfig
3. LSP capabilities are enhanced with nvim-cmp for autocompletion
4. LSP keybindings are configured in an `LspAttach` autocmd (runs when LSP attaches to buffer)
5. Currently configured LSPs: `lua_ls` (with stylua formatter)

### Code Formatting
- Uses conform.nvim for formatting
- Format on save is enabled by default (500ms timeout)
- Manual formatting via `<leader>f`
- Configured formatters: stylua (Lua), prettier/prettierd (JavaScript)

## Common Commands

This is a Neovim configuration, not a traditional development project. There are no build/test commands. However, key operations include:

### Plugin Management
```bash
# Launch Neovim
nvim

# Inside Neovim:
:Lazy              # Open plugin manager UI
:Lazy sync         # Update/install plugins
:Lazy clean        # Remove unused plugins
:Mason             # Open LSP/tool installer UI
```

### LSP Operations
```vim
:LspInfo           # Show LSP server status for current buffer
:LspStart          # Start LSP server
:LspStop           # Stop LSP server
:LspRestart        # Restart LSP server
```

### Formatting
- Format current buffer: `<leader>f` (or will auto-format on save)

## Key Bindings to Know

The leader key is `<Space>`.

### Navigation
- `<leader>sf` - Search files (Telescope)
- `<leader>sg` - Live grep (Telescope)
- `<leader>sn` - Search Neovim config files
- `<C-e>` - Toggle Harpoon quick menu
- `<leader>a` - Add file to Harpoon

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action

### Diagnostics
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `<leader>e` - Show diagnostic error messages

## Development Workflow

When modifying this Neovim configuration:

1. **Testing changes**: Simply restart Neovim or use `:source %` to reload the current file
2. **Adding new plugins**: Create a new file in `lua/plugins/` that returns a plugin spec table
3. **Modifying LSP settings**: Edit `lua/plugins/lsp.lua` and update the `servers` table
4. **Adding formatters**: Update `formatters_by_ft` in `lua/plugins/conform.lua`
5. **After plugin changes**: Run `:Lazy sync` to install/update

## Important Notes

- Leader key is Space (`<Space>`)
- Nerd Font is expected (vim.g.have_nerd_font = true)
- Clipboard is synced with OS (clipboard = "unnamedplus")
- Relative line numbers are enabled
- Format on save is enabled (can be disabled in conform.lua)
- This config uses Catppuccin Mocha theme
