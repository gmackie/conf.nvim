# Neovim Configuration

A modern Neovim configuration built on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), emphasizing LSP integration, fuzzy finding, and an efficient development workflow.

## Features

- **LSP Support**: Automatic language server installation and configuration via Mason
- **Fuzzy Finding**: Powerful file and text search with Telescope
- **Smart Completion**: Context-aware autocompletion with nvim-cmp
- **Code Formatting**: Automatic formatting on save with conform.nvim
- **Git Integration**: Inline git signs and hunks with gitsigns.nvim
- **Quick Navigation**: Fast file switching with Harpoon
- **Modern UI**: Catppuccin Mocha color scheme with which-key for discoverability
- **Syntax Highlighting**: Tree-sitter based highlighting and code understanding

## Prerequisites

- Neovim >= 0.9.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) (optional but recommended for icons)
- `make` (for building Telescope fzf-native)
- Language-specific tools (installed automatically via Mason as needed)

## Installation

1. **Backup your existing Neovim configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   mv ~/.local/share/nvim ~/.local/share/nvim.backup
   ```

2. **Clone this repository**:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. **Launch Neovim**:
   ```bash
   nvim
   ```

4. **Wait for plugins to install**: On first launch, lazy.nvim will automatically install all plugins. This may take a minute.

5. **Install language servers**: Open `:Mason` and install any additional language servers you need, or they'll be installed automatically when you open relevant files.

## Quick Start

### Leader Key
The leader key is set to `<Space>`.

### Essential Key Bindings

#### File Navigation
- `<leader>sf` - Search files
- `<leader>sg` - Live grep (search text across files)
- `<leader><leader>` - Find open buffers
- `<leader>sn` - Search Neovim config files

#### Harpoon (Quick File Navigation)
- `<leader>a` - Add current file to Harpoon
- `<C-e>` - Toggle Harpoon quick menu
- `<C-h>`, `<C-t>`, `<C-n>`, `<C-s>` - Jump to files 1-4

#### LSP Features
- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `[d` / `]d` - Previous/next diagnostic

#### Code Formatting
- `<leader>f` - Format current buffer (also auto-formats on save)

#### Window Navigation
- `<C-h>` / `<C-j>` / `<C-k>` / `<C-l>` - Move between splits

### Plugin Management
- `:Lazy` - Open plugin manager
- `:Lazy sync` - Update/install plugins
- `:Mason` - Manage LSP servers and tools

## Customization

### Adding Plugins
Create a new file in `lua/plugins/` that returns a plugin specification:

```lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration here
  end,
}
```

### Configuring Language Servers
Edit `lua/plugins/lsp.lua` and add your server to the `servers` table:

```lua
local servers = {
  lua_ls = { ... },
  -- Add your server here
  tsserver = {},
  pyright = {},
}
```

### Adding Formatters
Edit `lua/plugins/conform.lua` and add to `formatters_by_ft`:

```lua
formatters_by_ft = {
  lua = { "stylua" },
  python = { "black" },
  -- Add your formatters here
}
```

## File Structure

```
~/.config/nvim/
├── init.lua              # Entry point
├── lazy-lock.json        # Plugin versions (lock file)
├── CLAUDE.md            # Guide for Claude Code
└── lua/
    ├── user/            # User settings and configurations
    │   ├── settings.lua
    │   ├── keymaps.lua
    │   ├── commands.lua
    │   └── plugin.lua
    └── plugins/         # Individual plugin configurations
        ├── lsp.lua
        ├── telescope.lua
        ├── cmp.lua
        └── ...
```

## Troubleshooting

### LSP not working
1. Check LSP status: `:LspInfo`
2. Ensure language server is installed: `:Mason`
3. Restart LSP: `:LspRestart`

### Plugins not loading
1. Check for errors: `:checkhealth`
2. Reinstall plugins: `:Lazy clean` then `:Lazy sync`

### Formatting not working
1. Check if formatter is installed: `:Mason`
2. Verify formatter is configured in `lua/plugins/conform.lua`
3. Check for errors: `:ConformInfo`

## Credits

This configuration is based on [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and uses the following key plugins:

- [lazy.nvim](https://github.com/folke/lazy.nvim) - Plugin manager
- [mason.nvim](https://github.com/williamboman/mason.nvim) - LSP installer
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - LSP configurations
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finder
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Completion engine
- [conform.nvim](https://github.com/stevearc/conform.nvim) - Formatter
- [harpoon](https://github.com/ThePrimeagen/harpoon) - File navigation
- [catppuccin](https://github.com/catppuccin/nvim) - Color scheme

## License

This configuration is provided as-is for personal use and modification.
