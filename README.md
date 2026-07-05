# Chromebook 4 Dotfiles

Welcome to my personal dotfiles repository, optimized specifically for the **Samsung Chromebook 4**. This repository contains my custom configuration files for a lightweight, keyboard-driven environment using the i3 window manager.

---

## 🚀 Why Symbolic Links?

To get the most out of this repository, **I highly recommend creating symbolic links (symlinks)** from this folder to your `~/.config/` directory. 

Using symlinks ensures that any changes you make locally are immediately reflected in your repository, allowing for **better efficiency, easier management, and seamless version control** without constantly copying files back and forth.

---

## 📦 Requirements & Dependencies

Before applying these configurations, ensure you have the following packages installed. 

### Core Environment
* **Window Manager:** `i3` & `i3blocks` (status bar)
* **Shell:** `zsh` with `p10k` (Powerlevel10k theme)
* **Terminal:** `kitty`
* **Application Launcher:** `rofi`

### System Utilities
* **Wallpaper Setter:** `feh`
* **Audio Control:** `pavucontrol`
* **Screen Temperature (Blue Light Filter):** `gammastep`
* **Screenshot Tool:** `flameshot` (Note: Launch via `flameshot gui`)
* **Brightness Tool:** `brightnessctl `

### Development & Build Tools
* **Text Editor:** `nvim` (Neovim)
* **Compilers:** `clang`, `gcc`
* **Build Systems:** `build-essential`, `make`*, `cmake`*, `ninja`

---

## 📂 Repository Structure

Here is what this repository covers:

* `.config/i3/` -> Tiling window manager configurations tuned for the Chromebook 4 screen real estate.
* `.config/i3blocks/` -> Status bar modules (battery, CPU, audio, etc.).
* `.config/kitty/` -> GPU-accelerated terminal settings, fonts, and color schemes.
* `.config/nvim/` -> Neovim configuration optimized for C/C++ development (`clang`/`gcc`).
* `.config/rofi/` -> Custom theme for the application launcher.
* `.zshrc` -> Shell configurations, aliases, and Powerlevel10k integration.

---

## 🛠️ Setup & Installation

Follow these steps to install the required dependencies and link your configurations.

### 1. Install Dependencies
Ensure your system is updated and run the following command to install all necessary packages, compilers, and build tools:

```bash
sudo apt update && sudo apt install -y \
  i3 i3blocks kitty rofi feh pavucontrol gammastep flameshot \
  zsh nvim clang gcc build-essential make cmake ninja-build brightnessctl 
```

💡 Note on Fonts: Because this setup uses p10k and nvim, you must install a Nerd Font (like JetBrainsMono Nerd Font) in your terminal settings, or icons will not render correctly.

### 2. Clone and Create Symbolic Links

Using symbolic links (symlinks) ensures that any changes you make locally are immediately reflected in this repository. This allows for better efficiency, easier management, and seamless version control without constantly copying files back and forth.

Run the following commands to clone the repo and automatically symlink the configurations to your ~/.config directory:
```bash
git clone [https://github.com/DanielLustosaMiranda/chromebook-dotfiles.git] (https://github.com/DanielLustosaMiranda/chromebook-dotfiles.git])  ~/dotfiles
cd ~/dotfiles

# Create the .config directory if it doesn't exist
mkdir -p ~/.config

# Symlink the configuration folders
ln -sf ~/dotfiles/i3 ~/.config/i3
ln -sf ~/dotfiles/i3blocks ~/.config/i3blocks
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/rofi ~/.config/rofi

# Symlink the Zsh configuration to your home folder
ln -sf ~/dotfiles/.zshrc ~/.zshrc
```
