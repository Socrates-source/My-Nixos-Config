if status is-interactive
    set -g fish_greeting
    alias config='sudo -E  hx /etc/nixos/configuration.nix'
    alias rebuild='nh os switch'
    alias update='nh os switch --update'
end

if status is-login; and test (tty) = /dev/tty1; and test -z "$WAYLAND_DISPLAY"
    if uwsm check may-start; and uwsm select
        exec uwsm start default
    end
end
