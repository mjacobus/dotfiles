#!/bin/sh
# X session init script for i3 with faster startup and preserved session state

# Sessão X padrão
export XDG_SESSION_TYPE=x11
export XDG_CURRENT_DESKTOP=i3
export XDG_SESSION_DESKTOP=i3
export GDK_BACKEND=x11

# Evita problemas com GTK apps como o Brave
export XDG_RUNTIME_DIR="/run/user/$(id -u)"

# Executa uma sessão dbus e inicializa os daemons importantes
exec dbus-run-session -- bash -c '
  # Start gnome-keyring early (used by browsers, SSH, etc)
  eval "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)"
  export SSH_AUTH_SOCK

  # Workaround para apps snap/flatpak que dependem de xdg-desktop-portal
  systemctl --user import-environment DISPLAY XAUTHORITY
  systemctl --user start xdg-desktop-portal.service xdg-desktop-portal-gtk.service 2>/dev/null

  # Carrega tema e fontes GTK (evita travadas em apps GTK)
  [ -f ~/.Xresources ] && xrdb -merge ~/.Xresources

  exec i3
'
