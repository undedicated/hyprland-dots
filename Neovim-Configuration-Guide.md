<div align="center">
  <h1>Lily's Neovim Configuration Guide</h1>
  <p>A comprehensive, no-nonsense guide to configuring your Neovim experience using Lua.</p>
  <p>Learn everything in-depth about Neovim's configuration options, including powerful tools to help you theme easier and make you way more efficient when programming.</p>
</div>

---

## Entry Points

Neovim exposes lots of configuring options, variables, commands, and interacting with the editor's internals.

| Method         | Description                                                                                  |
|----------------|----------------------------------------------------------------------------------------------|
| `vim.opt`      | Recommended interface to set editor options, replacing the traditional Vimscript `set`. Supports chaining and type safety. |
| `vim.o`        | Direct access to global options (read/write).                                               |
| `vim.bo`       | Buffer-local options (specific to the current buffer).                                     |
| `vim.wo`       | Window-local options (specific to the current window).                                     |
| `vim.g`        | Global variables, typically used to interact with Vim plugins or set global states.         |
| `vim.b`        | Buffer-local variables.                                                                     |
| `vim.w`        | Window-local variables.                                                                     |
| `vim.t`        | Tabpage-local variables.                                                                    |
| `vim.v`        | Built-in, read-only Vim variables (like `vim.v.count`).                                    |
| `vim.env`      | Access and modify environment variables.                                                   |
| `vim.cmd()`    | Execute any Vimscript command from Lua.                                                    |
| `vim.api`      | The full Neovim API for deep integrations and editor manipulation.                         |
| `vim.fn`       | Call Vimscript built-in functions directly from Lua.                                       |

### Examples:

Set a global option (like enabling line numbers):

```lua
vim.opt.number = true
```

Set a buffer-local option (like setting tab width for the current buffer):

```lua
vim.bo.shiftwidth = 4
```

Set a window-local option (like enabling cursor line in the current window):

```lua
vim.wo.cursorline = true
```

Set a global variable to configure a plugin:

```lua
vim.g.nvim_tree_width = 30
```

Execute a Vimscript command (e.g., enable syntax highlighting):

```lua
vim.cmd("syntax enable")
```

Access an environment variable:

```lua
print(vim.env.HOME)
```

Call a Vimscript function (get the current buffer name):

```lua
local bufname = vim.fn.bufname('%')
print(bufname)
```

---

## Configuration Tools & Definitions

Neovim provides Lua-native functions to create keymaps, autocommands, custom commands, and schedule function execution asynchronously or after delays.

| Method                           | Description                                                                 |
|---------------------------------|-----------------------------------------------------------------------------|
| `vim.keymap.set()`              | Modern, concise API for key mappings supporting modes, options, and descriptions. |
| `vim.api.nvim_set_keymap()`     | Legacy key mapping function (more verbose and less ergonomic).              |
| `vim.api.nvim_create_autocmd()` | Define autocommands that run on specific events like file open, save, etc. |
| `vim.api.nvim_create_augroup()` | Create or clear groups of autocommands to organize your config.            |
| `vim.api.nvim_create_user_command()` | Define your own Neovim commands callable like built-in ones.           |
| `vim.schedule()`                | Schedule a Lua function to run soon (avoids blocking).                      |
| `vim.defer_fn(fn, timeout)`    | Schedule a Lua function to run after a specified delay in milliseconds.    |

### Examples:

Define a key mapping to save a file in normal mode:

```lua
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = "Save file" })
```

Create an autocommand that highlights the current line on entering a buffer:

```lua
local group = vim.api.nvim_create_augroup("MyHighlightGroup", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = group,
  pattern = "*",
  callback = function()
    vim.wo.cursorline = true
  end,
})
```

Create a custom command to clear search highlights:

```lua
vim.api.nvim_create_user_command('ClearHL', 'nohlsearch', {})
```

Schedule a function to print a message after 2 seconds:

```lua
vim.defer_fn(function()
  print("Hello after 2 seconds!")
end, 2000)
```

---

## Plugin Management

To extend Neovim's capabilities, plugin managers allow you to install, update, and configure plugins easily!

| Manager        | Description                                                    |
|----------------|----------------------------------------------------------------|
| **lazy.nvim**  | A modern, performant plugin manager with lazy-loading support. |
| **packer.nvim**| Classic, well-documented Lua plugin manager.                   |
| **rocks.nvim** | Manage LuaRocks packages and dependencies.                    |
| **mini.deps**  | Lightweight dependency manager for minimal configurations.    |

> These are examples and **not a full list**. Choose the one that fits you!

### Example setup with `lazy.nvim`:

```lua
require('lazy').setup({
  'nvim-treesitter/nvim-treesitter',
  'neovim/nvim-lspconfig',
  -- add more plugins here
})
```

---

## Options and Variables

Neovim options control editor behavior and appearance. Variables often configure plugins or state.

| Type              | API            | Description                                                  |
|-------------------|----------------|--------------------------------------------------------------|
| Global options    | `vim.opt`      | Set or get editor-wide options.                              |
| Buffer options    | `vim.bo`       | Options specific to the current buffer.                      |
| Window options    | `vim.wo`       | Options specific to the current window.                      |
| Global variables  | `vim.g`        | Variables with global scope, often plugin configurations.    |
| Environment vars  | `vim.env`      | Access to shell environment variables.                       |
| Built-in variables| `vim.v`        | Internal read-only variables exposed by Vim.                 |

### Examples:

Set global option for smart indentation:

```lua
vim.opt.smartindent = true
```

Set buffer option to disable spell checking in current buffer:

```lua
vim.bo.spell = false
```

Set a global variable to configure a plugin:

```lua
vim.g.gruvbox_contrast_dark = "hard"
```

Get the value of built-in variable `count` (number of times a command is repeated):

```lua
local count = vim.v.count
print("Repeat count: " .. count)
```

---

## Commands & Autocommands

Custom commands and autocommands allow you to automate tasks and extend Neovim's behavior.

| Type         | Function                            | Description                                  |
|--------------|-----------------------------------|----------------------------------------------|
| Run command  | `vim.cmd()`                       | Execute any Vimscript command.                |
| User command | `vim.api.nvim_create_user_command()` | Define your own Neovim commands.           |
| Autocommand  | `vim.api.nvim_create_autocmd()`   | Run functions on specific events like file save. |
| Autogroup    | `vim.api.nvim_create_augroup()`   | Group related autocommands for better management.|

### Examples:

Create a user command to toggle line numbers:

```lua
vim.api.nvim_create_user_command("ToggleNumber", function()
  vim.opt.number = not vim.opt.number:get()
end, {})
```

Create an autocommand to automatically trim trailing whitespace before saving:

```lua
local trim_group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
  group = trim_group,
  pattern = "*",
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
})
```

---

## Key Mappings

Key mappings are essential to customize your editing experience. Neovim provides modern Lua APIs for this.

| Method                          | Description                                               |
|--------------------------------|-----------------------------------------------------------|
| `vim.keymap.set(mode, lhs, rhs, opts)` | Preferred, ergonomic keybinding method with descriptions. |
| `vim.api.nvim_set_keymap(mode, lhs, rhs, opts)` | Older, verbose method for keybindings.           |

### Modes:

| Mode | Description                |
|-------|----------------------------|
| `n`   | Normal mode                |
| `i`   | Insert mode                |
| `v`   | Visual mode                |
| `x`   | Visual block mode          |
| `t`   | Terminal mode              |
| `c`   | Command-line mode          |

### Examples:

Map `<leader>q` to quit Neovim in normal mode:

```lua
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = "Quit Neovim" })
```

Map `jk` to escape insert mode quickly:

```lua
vim.keymap.set('i', 'jk', '<Esc>', { desc = "Exit insert mode" })
```

Legacy way of mapping Ctrl-s to save file:

```lua
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
```

---

## Sources & Further Reading

- [Neovim Lua API Documentation](https://neovim.io/doc/user/lua.html) — Official documentation on Neovim's Lua interface.
- [Neovim Lua Guide](https://github.com/nanotee/nvim-lua-guide) — Community-driven guide for Neovim Lua configuration.
- [lazy.nvim GitHub Repository](https://github.com/folke/lazy.nvim) — Documentation and examples for the lazy.nvim plugin manager.
- [packer.nvim GitHub Repository](https://github.com/wbthomason/packer.nvim) — Plugin manager for Neovim written in Lua.
- [Vim Help Docs](https://vimhelp.org/) — Vim's extensive help files (many concepts still apply).
- [Neovim Wiki](https://github.com/neovim/neovim/wiki) — Community wiki with many tips, tricks, and guides.
- [vim.fn — Vimscript Functions from Lua](https://neovim.io/doc/user/lua.html#lua-vim-fn) — How to call Vimscript functions in Lua.
- [Neovim Autocommands](https://neovim.io/doc/user/autocmd.html) — Official documentation on autocommands.

---

