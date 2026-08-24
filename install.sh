#!/usr/bin/env bash

set -euo pipefail

info()  { printf '\033[1;34m[INFO]\033[0m %s\n' "$1"; }
warn()  { printf '\033[1;33m[WARN]\033[0m %s\n' "$1"; }
error() { printf '\033[1;31m[ERROR]\033[0m %s\n' "$1"; }

if [[ $EUID -eq 0 ]]; then
    error "Do not run this script as root. It will call sudo when needed."
    exit 1
fi

if ! command -v pacman &>/dev/null; then
    error "pacman not found. This script only works on Arch Linux (or an Arch derivative)."
    exit 1
fi

install_yay() {
    if command -v yay &>/dev/null; then
        info "yay already installed, skipping."
        return
    fi
    info "Installing yay (AUR helper)..."
    sudo pacman -S --needed --noconfirm base-devel git
    local tmpdir
    tmpdir=$(mktemp -d)
    git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
    (cd "$tmpdir/yay" && makepkg -si --noconfirm)
    rm -rf "$tmpdir"
}

CORE_PKGS=(
    hyprland
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk
)

UTILITY_PKGS=(
    waybar
    wofi
    hyprpaper
    hyprlock
    wl-clipboard
    brightnessctl
)

DESKTOP_PKGS=(
    alacritty
    nautilus
    ttf-jetbrains-mono-nerd
    ttf-font-awesome
    noto-fonts
    noto-fonts-emoji
)

SYSTEM_PKGS=(
    pipewire
    pipewire-alsa
    pipewire-pulse
    pipewire-jack
    wireplumber
    sddm
    polkit
)

AUR_PKGS=(
    hyprshot
    wlogout
    swww
    hyprland-per-window-layout-git
    wl-clip-persist
)

info "Updating system..."
sudo pacman -Syu --noconfirm

info "Installing core Hyprland packages..."
sudo pacman -S --needed --noconfirm "${CORE_PKGS[@]}"

info "Installing Hyprland ecosystem utilities..."
sudo pacman -S --needed --noconfirm "${UTILITY_PKGS[@]}"

info "Installing desktop essentials (terminal, file manager, fonts, theming)..."
sudo pacman -S --needed --noconfirm "${DESKTOP_PKGS[@]}"

info "Installing system/audio/login manager packages..."
sudo pacman -S --needed --noconfirm "${SYSTEM_PKGS[@]}"

install_yay

info "Installing AUR packages..."
yay -S --needed --noconfirm "${AUR_PKGS[@]}"

info "Enabling sddm (display manager) and bluetooth..."
sudo systemctl enable sddm.service || warn "Failed to enable sddm"
sudo systemctl enable bluetooth.service || warn "Failed to enable bluetooth"

info "Installation complete!"
