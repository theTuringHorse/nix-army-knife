function yz --description 'Run yazi and cd into the last directory on exit'
    set -l tmp (mktemp -t yazi-cwd.XXXXXX)
    yazi $argv --cwd-file="$tmp"

    if test -f "$tmp"
        set -l cwd (cat "$tmp")
        if test -n "$cwd"; and test "$cwd" != "$PWD"
            cd "$cwd"
        end
        rm -f "$tmp" >/dev/null
    end
end
