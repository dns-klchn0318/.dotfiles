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

## Writing and completion

Markdown, MDX, text, and commit-message buffers use visual line wrapping,
indentation on wrapped lines, and Neovim's built-in spell checker with Russian
first and English as an additional language. `textwidth = 0` keeps prose lines
visually wrapped without inserting hard line breaks as you type. If the Russian
dictionary is missing, Neovim's built-in spellfile support offers to download
it to its user data directory on first use. Spell suggestions are available
with `z=`, and spell checking can be toggled with `<Space>ts`.

Completion is provided by `nvim-cmp`, loaded on the first Insert-mode entry.
It automatically suggests matching words from the current buffer (after two
characters) and filesystem paths. `<Ctrl-Space>` opens the menu manually,
`<Tab>` / `<Shift-Tab>` move through its candidates, `<Ctrl-e>` closes it, and
`<Enter>` confirms only a candidate you selected; it does not accept the first
suggestion by default. There is no LSP or snippet completion configured.

Markdown writing keys:

- `<Space>mf` — toggle focus mode (hide and restore line numbers, sign column,
  and cursor line in the current window)
- `<Space>mw` — show the current buffer's word count
- `<Space>mt` — toggle the checkbox on the current task-list line
- `]h` / `[h` — jump to the next / previous Markdown heading
- `gqap` — reflow the current paragraph to the terminal width

Useful keys:

- `<Space>e` — toggle nvim-tree
- `<Space>E` — focus nvim-tree
- `<Shift-l>` / `<Shift-h>` — next / previous buffer
- `<Space>tn` / `<Space>tc` — open / close a tab page
- `<Space>tl` / `<Space>th` — next / previous tab page (also `gt` / `gT`)
- `<Space>w` — save
- `<Space>bd` — close buffer
- `<Ctrl-Space>` in insert mode — open completion

The top bar lists buffers (open files), which are shared across tab pages; it
does not show tab pages. Tab pages hold separate window layouts. To open a file
in a new tab, use `:tabedit path`. Use `:tabs` to list tab pages, or `:ls` and
`:buffer N` to list and select buffers. Closing a modified buffer or tab still
asks you to save your work.

Prose wraps visually without changing the file; `j` and `k` move by display
line, while a count such as `5j` moves by file lines. Other files, including
code and logs, do not wrap by default; `:setlocal wrap` toggles it on. When
returning to Neovim or pausing in Normal mode, unmodified files changed by
another program are reloaded. Modified buffers are not silently overwritten.
Wrap and spell settings return to their file-type defaults when entering a
buffer; use `<Space>ts` or `:setlocal wrap` again to change them temporarily.
