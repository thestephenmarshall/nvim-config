# nvim-config

My custom Neovim configuration with modern plugins and sensible defaults.

## Features

### Core Features
- 🚀 Fast startup time with lazy loading
- 🎨 Beautiful Catppuccin colorscheme
- 📁 File explorer with nvim-tree
- 🔍 Fuzzy finder with Telescope
- 🌈 Syntax highlighting with Treesitter
- 💡 LSP support with mason.nvim
- ⚡ Autocompletion with nvim-cmp
- 🔧 Formatting with conform.nvim
- 🐛 Linting with nvim-lint
- 📊 Git integration with gitsigns
- 🎯 Key binding hints with which-key

### Included Plugins
- **Plugin Manager**: lazy.nvim
- **Colorscheme**: Catppuccin
- **File Explorer**: nvim-tree
- **Fuzzy Finder**: Telescope
- **Syntax Highlighting**: Treesitter
- **LSP**: nvim-lspconfig, mason.nvim
- **Completion**: nvim-cmp
- **Formatting**: conform.nvim
- **Linting**: nvim-lint
- **Git**: gitsigns.nvim
- **UI**: lualine, bufferline, indent-blankline, which-key
- **Editing**: Comment.nvim, nvim-autopairs

## Installation

### Prerequisites
- Neovim >= 0.9.0
- Git
- A Nerd Font (for icons)
- ripgrep (for Telescope live grep)
- Node.js (for some LSP servers)

### Steps

1. Backup your existing Neovim configuration:
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone this repository:
```bash
git clone https://github.com/thestephenmarshall/nvim-config.git ~/.config/nvim
```

3. Start Neovim:
```bash
nvim
```

The plugin manager (lazy.nvim) will automatically install all plugins on first launch.

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── core/
│   │   ├── options.lua      # Neovim options
│   │   └── keymaps.lua      # Key mappings
│   └── plugins/
│       ├── colorscheme.lua  # Theme configuration
│       ├── nvim-tree.lua    # File explorer
│       ├── telescope.lua    # Fuzzy finder
│       ├── treesitter.lua   # Syntax highlighting
│       ├── lsp.lua          # LSP configuration
│       ├── mason.lua        # LSP installer
│       ├── autocompletion.lua
│       ├── formatting.lua
│       ├── linting.lua
│       ├── gitsigns.lua
│       ├── comment.lua
│       ├── autopairs.lua
│       ├── indent-blankline.lua
│       ├── lualine.lua
│       ├── bufferline.lua
│       └── which-key.lua
```

## Key Mappings

Leader key: `<Space>`

### General
- `<leader>nh` - Clear search highlights
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>Q` - Quit all

### Window Management
- `<leader>sv` - Split window vertically
- `<leader>sh` - Split window horizontally
- `<leader>se` - Make splits equal size
- `<leader>sx` - Close current split

### File Explorer (nvim-tree)
- `<leader>ee` - Toggle file explorer
- `<leader>ef` - Toggle file explorer on current file
- `<leader>ec` - Collapse file explorer
- `<leader>er` - Refresh file explorer

### Fuzzy Finder (Telescope)
- `<leader>ff` - Find files
- `<leader>fr` - Find recent files
- `<leader>fs` - Find string in current directory
- `<leader>fc` - Find string under cursor
- `<leader>fb` - List buffers
- `<leader>fh` - Find help

### LSP
- `gR` - Show LSP references
- `gD` - Go to declaration
- `gd` - Show LSP definitions
- `gi` - Show LSP implementations
- `gt` - Show LSP type definitions
- `<leader>ca` - See available code actions
- `<leader>rn` - Smart rename
- `<leader>D` - Show buffer diagnostics
- `<leader>d` - Show line diagnostics
- `[d` - Go to previous diagnostic
- `]d` - Go to next diagnostic
- `K` - Show documentation

### Formatting & Linting
- `<leader>mp` - Format file or range
- `<leader>l` - Trigger linting

### Git (gitsigns)
- `]c` - Next hunk
- `[c` - Previous hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hp` - Preview hunk
- `<leader>hb` - Blame line
- `<leader>tb` - Toggle line blame

### Tabs
- `<leader>to` - Open new tab
- `<leader>tx` - Close current tab
- `<leader>tn` - Go to next tab
- `<leader>tp` - Go to previous tab

### Buffers
- `<leader>bn` - Next buffer
- `<leader>bp` - Previous buffer
- `<leader>bd` - Delete buffer

## Customization

To customize the configuration:

1. Edit core settings: `lua/core/options.lua`
2. Modify keymaps: `lua/core/keymaps.lua`
3. Add/remove plugins: Create/delete files in `lua/plugins/`
4. Configure individual plugins: Edit the respective plugin file

## Supported Language Servers

The configuration includes setup for:
- Lua (lua_ls)
- TypeScript/JavaScript (ts_ls)
- Python (pyright)
- Rust (rust_analyzer)
- Go (gopls)

Additional language servers can be installed via Mason (`:Mason`).

## License

MIT
