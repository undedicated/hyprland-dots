# Useful Information
Hyprland is a Wayland Window Manager, just like Sway is, for Arch Linux (or Arch-based systems, such as Manjaro).
Natively, Hyprland doesn't provide support for distros like Ubuntu, Mint, etc.; however, there are ways to use the Hyprland Window Manager, it just takes a little more effort.

Also, Hyprland and Nvidia aren't great together, but they do work, with some slight tweaks, so just be aware of that.

If you'd like to learn more about Hyprland, read the docs, or just look around, feel free to [check out the Hyprland Wiki](https://wiki.hypr.land/Hypr-Ecosystem/hyprlang/)

# Installing the Configuration
Open a terminal with your current keybinds and run the following command:
```bash
cd ~/.config/hypr
```

Create a file called: **binds.conf**, which the file for all of our keybinds,
 and modify the **hyprland.conf** default config file, using `nano`, `nvim`, `vim`, etc.

Copy and paste (or rewrite) the config data into these files, and enjoy!!

> [!TIP]
> It's important to know for all keybinds to work as expected, you do need the apps actually downloaded first.

# Installing Packages
You may install a package on Arch Linux using the following command (With <pkg> being the package name):
```bash
sudo pacman -S <pkg>
```

Flatpak is also highly recommended to be installed, check it out [here](https://flathub.org/)
