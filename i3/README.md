## I3

### Dependencies

Install core i3 packages:

```bash
sudo apt update
sudo apt install i3 i3status i3lock dmenu rofi
```

Install additional utilities:

```bash
sudo apt install xautolock dunst nautilus gnome-terminal flatpak scrot xclip
```

Install Flatpak applications:

```bash
flatpak install flathub org.chromium.Chromium
flatpak install flathub us.zoom.Zoom
```

Install bluetuith (Bluetooth TUI):

```bash
# Already installed to ~/.local/bin/bluetuith
# If not present, download from: https://github.com/bluetuith-org/bluetuith/releases
```

### Optional

For gaps support, i3 version 4.22+ is required. Ubuntu 22.04 ships with i3 4.20.1 which doesn't support gaps.
