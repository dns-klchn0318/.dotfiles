# Neovim

This package is managed with GNU Stow from the dotfiles directory:

```sh
stow nvim
```

The first Neovim launch bootstraps `lazy.nvim`; Lazy then downloads nvim-tree,
bufferline, lualine, and nvim-cmp with its buffer and path sources. This does
not install system applications or language servers. It requires `git` and
network access on that first launch.

The ClearDark colorscheme is local, keeps the editor background transparent,
and uses Terminal.app's dark charcoal and soft-gray look. Syntax highlighting
uses Neovim's built-in filetype syntax, so no parser or compiler is needed.

Markdown, text, and commit-message buffers use Neovim's built-in spell checker
with Russian first and English as an additional language. If the Russian
dictionary is missing, Neovim's built-in spellfile support offers to download
it to its user data directory on first use. Spell suggestions are available
with `z=`, and spell checking can be toggled with `<Space>ts`.

Useful keys:

- `<Space>e` — toggle nvim-tree
- `<Space>E` — focus nvim-tree
- `<Shift-l>` / `<Shift-h>` — next / previous buffer
- `<Space>w` — save
- `<Space>bd` — close buffer
- `<Ctrl-Space>` in insert mode — open completion
