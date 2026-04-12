pin() {
  local data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/pin"
  local data_file="$data_dir/commands.tsv"

  # Ensure data dir exists
  [[ -d "$data_dir" ]] || mkdir -p "$data_dir"
  [[ -f "$data_file" ]] || touch "$data_file"

  # --- Flags ---
  case "$1" in
    -h|--help)
      cat <<'EOF'
pin — bookmark shell commands

Usage:
  pin <key>        Save the previous command under <key>
  pin              Fuzzy-find a saved command and place it at the prompt
  pin -l           List all saved commands
  pin -d <key>     Delete a saved command
  pin -e           Edit the data file in $EDITOR
  pin -h           Show this help

Storage: ${XDG_DATA_HOME:-~/.local/share}/pin/commands.tsv
EOF
      return 0
      ;;
    -l|--list)
      if [[ ! -s "$data_file" ]]; then
        echo "No pinned commands yet. Run a command then \`pin <key>\` to save it."
        return 0
      fi
      while IFS=$'\t' read -r key cmd; do
        printf '%s → %s\n' "$key" "$cmd"
      done < "$data_file"
      return 0
      ;;
    -d|--delete)
      shift
      local del_key="$*"
      if [[ -z "$del_key" ]]; then
        echo "pin: -d requires a key" >&2
        return 1
      fi
      if ! grep -qP "^${del_key}\t" "$data_file" 2>/dev/null; then
        echo "pin: no entry for '$del_key'" >&2
        return 1
      fi
      local tmp="$data_file.tmp.$$"
      grep -vP "^${del_key}\t" "$data_file" > "$tmp"
      mv "$tmp" "$data_file"
      echo "Deleted '$del_key'"
      return 0
      ;;
    -e|--edit)
      "${EDITOR:-vi}" "$data_file"
      return 0
      ;;
  esac

  # --- Retrieve mode (no args) ---
  if [[ $# -eq 0 ]]; then
    if [[ ! -s "$data_file" ]]; then
      echo "No pinned commands yet. Run a command then \`pin <key>\` to save it."
      return 0
    fi
    local display
    display=$(while IFS=$'\t' read -r key cmd; do
      printf '%s → %s\n' "$key" "$cmd"
    done < "$data_file")

    local selection
    selection=$(echo "$display" | fzf --select-1 --prompt="pin> " --height=~50%) || return 0
    # Extract command (everything after " → ")
    local cmd="${selection#* → }"
    print -z "$cmd"
    return 0
  fi

  # --- Save mode ---
  local key="$*"
  local prev_cmd
  prev_cmd=$(fc -ln -1 | sed 's/^[[:space:]]*//')

  # If fc captured the pin invocation itself, go back one more
  if [[ "$prev_cmd" == "pin" || "$prev_cmd" == "pin "* ]]; then
    prev_cmd=$(fc -ln -2 -2 | sed 's/^[[:space:]]*//')
  fi

  if [[ -z "$prev_cmd" ]]; then
    echo "pin: could not determine previous command" >&2
    return 1
  fi

  # Remove existing entry with same key (if any), then append
  if grep -qP "^${key}\t" "$data_file" 2>/dev/null; then
    local tmp="$data_file.tmp.$$"
    grep -vP "^${key}\t" "$data_file" > "$tmp"
    mv "$tmp" "$data_file"
  fi

  printf '%s\t%s\n' "$key" "$prev_cmd" >> "$data_file"
  echo "Pinned '$key' → $prev_cmd"
}
