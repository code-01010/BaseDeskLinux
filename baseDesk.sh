echo "-------------- BaseDesk Installer --------------"

if [ -e "/var/finish_baseDesk" ]; then
    echo "Installing packages..."
    sudo pacman -S pulseaudio pulseaudio-alsa pavucontrol firefox vlc gimp xfburn thunderbird gedit gnome-system-monitor
    echo "Installing packages... Done"
    sudo rm /var/finish_baseDesk
    echo "-------------- BaseDesk Installer Done --------------"
    exit 0
fi

echo "-------------- Updateing packages --------------"
echo "-------------- Installing yay AUR --------------"
sudo pacman -S base-devel
sudo pacman -S git
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
echo "-------------- Installing yay AUR Complete --------------"
echo "-------------- Installing cinnamon --------------"
sudo pacman -S cinnamon gnome-terminal
sudo pacman -S xorg lightdm lightdm-gtk-greeter
systemctl enable lightdm
systemctl enable NetworkManager
sudo touch /var/finish_baseDesk
