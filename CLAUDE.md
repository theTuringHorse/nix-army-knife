# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repository managed with **GNU Stow**. Configurations target a Wayland/Hyprland desktop with Neovim, WezTerm, Zsh, and a range of CLI tools.

## Deployment

```bash
# From the repo root, stow everything into ~
stow -v --target=$HOME .
```

Stow creates symlinks: files in `dots/.config/` map to `~/.config/`. The `.stow-local-ignore` file prevents symlinking VCS and README files.

Local overrides (not tracked) follow the pattern `*.local.*` or `*.local` — e.g., `rc.local.sh` for shell, `tmux.conf.local` for tmux.

## Architecture

### Shell (`zsh/` → `$ZDOTDIR`)

Load order: `.zshenv` → `.zprofile` → `.zshrc`

- `.zshenv` — sets XDG dirs and tool homes (CARGO_HOME, RUSTUP_HOME, GOPATH, etc.)
- `.zprofile` — PATH assembly, default programs (`$EDITOR=nvim`, `$TERMINAL=wezterm`, `$BROWSER=firefox`), fzf defaults
- `.zshrc` — completion system, vi-mode keybindings, sources all files in `shell/auto/`
- `keybinds.zsh` — vi-style key bindings, history search
- `shell/auto/rc.sh` — optional tool init: yazi shell wrapper, thefuck, eza, fzf, starship, zoxide, direnv (each guarded by `command -v`)
- `shell/auto/alias.sh` — aliases (`ls`→eza, `cd`→zoxide, git shortcuts, kubectl, terraform, delta for diff)

### Neovim (`nvim/`)

Plugin-manager-free. Entry point is `init.lua` which sets `<Space>` as leader and requires three modules:

- `lua/keymaps.lua` — tab/buffer nav, split management, file explorer, save
- `lua/options.lua` — tabs=4 spaces, relative line numbers, mouse, case-insensitive search
- `lua/status.lua` — custom Gruvbox statusline

### Hyprland (`hypr/`)

- `hyprland.conf` — monitor setup, autostart (waybar), appearance (gaps, borders, rounded corners)
- `keybinds.conf` — `$mainMod = Super`; workspaces 1–10, window management, volume/brightness via `wpctl`/`brightnessctl`

### Key tool configs

| File | Notable settings |
|------|-----------------|
| `wezterm/wezterm.lua` | Font size 20, opacity 0.9, Alt+L launcher |
| `tmux/tmux.conf` | oh-my-tmux base (do not edit directly) |
| `tmux/tmux.conf.local` | Local overrides for theme and bindings |
| `starship.toml` | aws (region aliases), kubernetes, direnv, git_metrics enabled; gcloud/package disabled |
| `yazi/yazi.toml` | Panel ratio 1:4:3, vi-style nav |
| `git/.gitconfig` | Aliases: `s`, `c`, `go` (push), `au` (add -u) |

### Global gitignore (`git/ignore`)

Ignores `.envrc`, `.local*`, `.local.*`, and `.claude/settings.local.json` across all repos.
