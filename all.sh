# seguir esse guia aqui:
# https://github.com/devangshekhawat/Fedora-43-Post-Install-Guide
#
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm 
sudo dnf install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
sudo dnf group upgrade core -y
sudo dnf4 group install core -y
sudo dnf -y update

sudo dnf4 group install multimedia -y
sudo dnf swap -y 'ffmpeg-free' 'ffmpeg' --allowerasing # Switch to full FFMPEG.
sudo dnf upgrade -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin # Installs gstreamer components. Required if you use Gnome Videos and other dependent applications.
sudo dnf group install -y sound-and-video # Installs useful Sound and Video complementary packages.

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

sudo dnf in -y \
fzf \
fuse-libs \
pipx \
neovim \
unzip \
p7zip \
p7zip-plugins \
unrar
mpv \
go \
fzf \
tldr \
zoxide \
nautilus-python \
git \
fish

pipx install \
flatgrep

# Install flatpaks
flatpak install -y \ 
	com.mattjakeman.ExtensionManager 
	it.mijorus.gearlever	

# startship install 
curl -sS https://starship.rs/install.sh | sh
curl -LsSf https://astral.sh/uv/install.sh | sh

# setup shell
sudo chsh -s /usr/bin/fish
set -U fish_user_paths ~/.local/bin/flatgrep

# setup git
./set-git-usr.sh

# firefox default page
sudo rm -f /usr/lib64/firefox/browser/defaults/preferences/firefox-redhat-default-prefs.js

# setup firewall
sudo firewall-cmd --permanent --zone=public --add-service=kdeconnect
sudo firewall-cmd --permanent --zone=public --add-service=ssh

alias n="nvim"
alias cls="clear"
alias c="cd"
alias p="pwd"
set -gx EDITOR nvim

# Keyd install
sudo dnf copr -y enable alternateved/keyd
sudo dnf install keyd -y


