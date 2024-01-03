# Notes for installation:

Nordvpn:

```
    git clone https://aur.archlinux.org/nordvpn-bin.git
```

(Possibly option - not used?)

```
    sudo pacman -S fakeroot
```

(go into the git cloned folder) 
    
```
makepkg -si
```

```
sudo systemctl start nordvpn
```

    sudo systemctl enable nordvpn

    Check if nordvpn runs systemctl status nordvpn

    Then login nordvpn login --legacy the new browser login didnt work for me.

    Then i thing it was sudo nordvpn set killswitch enable
```
