<div align="center">
  <h1>Lily's Neovim Configuration Guide</h1>
  A no-nonsense guide to configuring your Neovim experience using Lua. Learn everything, in-depth about Neovim's configuration options, alongside tools to help you theme easier.
</div>

---

## Core Entry Points
| Method | Description |
|--------|-------------|
| `vim.opt` | Interface for setting options (replaces `set` in Vimscript) |
| `vim.o`, `vim.bo`, `vim.wo` | Direct option tables (global, buffer-local, window-local) |
| `vim.g` | Global variables |
| `vim.b` | Buffer-local variables |
| `vim.w` | Window-local variables |
| `vim.t` | Tabpage-local variables |
| `vim.v` | Built-in (native) variables |
| `vim.env` | Access or modify environment variables |
| `vim.cmd()` | Run any Vimscript command |
| `vim.api` | Full Neovim API bindings |
| `vim.fn` | Access built-in Vimscript functions |

---

## Configuration Tools & Definitions

| Method | Description |
|--------|-------------|
| `vim.keymap.set()` | Modern Lua API for key mappings |
| `vim.api.nvim_set_keymap()` | Legacy key mapping function |
| `vim.api.nvim_create_autocmd()` | Define autocommands for events |
| `vim.api.nvim_create_augroup()` | Create or clear autocommand groups |
| `vim.api.nvim_create_user_command()` | Define custom commands |
| `vim.schedule()` | Defer function execution safely |
| `vim.defer_fn(fn, timeout)` | Execute function after a delay |

---

## Plugin Management
Install third party plugins to make your Neovim experience a lot more user friendly and easier to manage.

| Manager | Description |
|----------|-------------|
| **lazy.nvim** | Modern, efficient plugin manager with lazy-loading |
| **packer.nvim** | Classic Lua-based plugin manager |
| **rocks.nvim** | LuaRocks-based plugin management |
| **mini.deps** | Lightweight dependency manager |

> Keep in mind these aren't the _only_ packages, just some examples.

---

## Options and Variables

| Type | API |
|------|-----|
| Global options | `vim.opt` |
| Buffer options | `vim.bo` |
| Window options | `vim.wo` |
| Global variables | `vim.g` |
| Environment variables | `vim.env` |
| Built-in Vim variables | `vim.v` |

---

## Commands & Autocommands

| Type | Function |
|------|-----------|
| Run command | `vim.cmd()` |
| User command | `vim.api.nvim_create_user_command()` |
| Autocommand | `vim.api.nvim_create_autocmd()` |
| Autogroup | `vim.api.nvim_create_augroup()` |

---

## Key Mappings

| Method | Description |
|---------|-------------|
| `vim.keymap.set(mode, lhs, rhs, opts)` | Preferred keybinding method |
| `vim.api.nvim_set_keymap(mode, lhs, rhs, opts)` | Older API for keybindings |
