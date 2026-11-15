# Repository Guidelines

## Project Structure & Module Organization

This repository contains macOS Apple Silicon dotfiles installed with GNU Stow. Each top-level package mirrors paths relative to the home directory:

- `zsh/.zshrc`: shell environment, aliases, and integrations.
- `tmux/.tmux.conf`: terminal sessions, key bindings, and appearance.
- `starship/.config/starship.toml`: prompt configuration.
- `ghostty/.config/ghostty/config`: Ghostty palette, transparency, and blur.
- `nvim/.config/nvim/init.lua`: editor options, mappings, and lazy.nvim plugins.
- `nvim/.config/nvim/colors/cleardark.lua`: local colorscheme.

`README.md` documents installation; the Neovim package has its own README. There are no separate application sources, test directories, or asset pipeline.

## Build, Test, and Development Commands

Run Stow commands from the repository root. No build step is required.

- `stow --simulate --verbose --target="$HOME" zsh tmux starship ghostty nvim`: preview symlinks and detect conflicts.
- `stow --verbose --target="$HOME" zsh tmux starship ghostty nvim`: install symlinks after backing up conflicting files.
- `stow --restow --target="$HOME" zsh tmux starship ghostty nvim`: refresh installed links.
- `zsh -n zsh/.zshrc`: check shell syntax without executing startup commands.
- `exec zsh`: reload the shell after installing changes.

## Coding Style & Naming Conventions

Preserve each file’s existing layout and comment language. Use two-space indentation in Lua and shell blocks; keep Lua option names and plugin declarations consistent with existing code. Keep configuration inside its matching Stow package, retaining hidden filenames and home-relative paths. No formatter or linter is configured. Document new dependencies and key bindings in the relevant README.

## Testing Guidelines

There is no automated test framework or coverage requirement. Run the Stow preview and applicable syntax checks, then manually exercise affected behavior: shell aliases, tmux bindings, prompt rendering, or Neovim mappings and colors. Neovim’s first launch downloads lazy.nvim and plugins, requiring Git and network access. Record checks performed in the pull request.

## Commit & Pull Request Guidelines

The current history contains `Add dotfiles and setup instructions`. Follow that concise, imperative style, for example `Update tmux navigation bindings`. Keep changes focused. Pull requests should describe the affected packages, behavior changes, dependencies, and validation. Link relevant issues and include screenshots for visible prompt or theme changes.

## Security & Configuration Tips

Never commit credentials or machine-specific secrets. `.gitignore` excludes `.env`, `.env.*` (except `.env.example`), and `*.local`. Existing configuration assumes Homebrew at `/opt/homebrew` and macOS clipboard tools; document portability changes explicitly.
