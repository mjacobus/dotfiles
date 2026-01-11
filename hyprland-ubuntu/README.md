# Hyprland Configuration for Ubuntu 25.10

Standalone Hyprland configuration for Ubuntu 25.10 (Wayland), without omarchy dependencies.

## Required Packages

```bash
sudo apt install -y \
    hyprland \
    wofi \
    grim \
    slurp \
    wl-clipboard \
    dunst \
    hyprlock \
    hypridle \
    polkit-gnome \
    gnome-terminal \
    nautilus \
    pavucontrol \
    chromium
```

### Package Descriptions

| Package | Purpose |
|---------|---------|
| `hyprland` | Wayland compositor |
| `wofi` | Application launcher (Wayland-native rofi alternative) |
| `grim` | Screenshot utility for Wayland |
| `slurp` | Region selection tool (used with grim) |
| `wl-clipboard` | Clipboard utilities (wl-copy, wl-paste) |
| `dunst` | Notification daemon |
| `hyprlock` | Lock screen for Hyprland |
| `hypridle` | Idle daemon (screen lock, DPMS, suspend timers) |
| `polkit-gnome` | Authentication agent for GUI sudo prompts |
| `gnome-terminal` | Terminal emulator |
| `nautilus` | File manager |
| `pavucontrol` | PulseAudio volume control |
| `chromium` | Browser for --app mode web apps |

### Optional Packages

```bash
# Bluetooth TUI
sudo apt install -y bluetuith

# Status bar (if you want one)
sudo apt install -y waybar

# Wallpaper setter
sudo apt install -y swaybg

# Clipboard history manager
sudo apt install -y cliphist
```

## Installation

```bash
cd ~/.dotfiles

# If old hypr package is stowed, unstow it first
stow -D hypr

# Stow the new config
stow hyprland-ubuntu
```

## Post-Installation

### 1. Configure Monitors

After logging into Hyprland, run:

```bash
hyprctl monitors
```

Edit `~/.config/hypr/monitors.conf` with your actual monitor names (e.g., `DP-1`, `HDMI-A-1`, etc.).

### 2. Select Hyprland as Session

At the login screen (GDM), click the gear icon and select "Hyprland" as your session.

## Key Bindings

| Keybinding | Action |
|------------|--------|
| `Super+D` | App launcher (wofi) |
| `Super+Return` | Terminal |
| `Super+B` | Browser |
| `Super+W` | Close window |
| `Super+F` | Fullscreen |
| `Super+V` | Toggle floating |
| `Super+H/J/K/L` | Focus left/down/up/right |
| `Super+Shift+H/J/K/L` | Move window |
| `Super+Alt+H/J/K/L` | Resize window |
| `Super+1-0` | Switch to workspace 1-10 |
| `Super+Shift+1-0` | Move window to workspace |
| `Super+Alt+L` | Lock screen |
| `Super+X` | Screenshot selection |

### Web Apps (Chromium --app mode)

| Keybinding | App |
|------------|-----|
| `Super+A` | ChatGPT |
| `Super+Shift+A` | Grok |
| `Super+C` | Google Calendar (personal) |
| `Super+Shift+C` | Google Calendar (work) |
| `Super+E` | Gmail (personal) |
| `Super+Shift+E` | Gmail (work) |
| `Super+S` | Slack (CredClub) |
| `Super+Shift+S` | Slack (Work) |
| `Super+Y` | YouTube |
| `Super+Shift+W` | WhatsApp |
| `Super+Shift+T` | Telegram |
| `Super+P` | GitHub Projects |
| `Super+Shift+P` | Linear |

## Troubleshooting

### Chromium not found

If using snap chromium, update `bindings.conf`:

```conf
$browser = /snap/bin/chromium
```

### No authentication prompts

Ensure polkit agent is running. Check `autostart.conf` path:

```bash
ls /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
# or try
ls /usr/libexec/polkit-gnome-authentication-agent-1
```

### Screen not locking

Ensure hypridle is running:

```bash
pgrep hypridle || hypridle &
```
