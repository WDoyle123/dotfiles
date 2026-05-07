# Notes for installation:

## Void Linux — Audio (PipeWire + Sway)

Install PipeWire and session manager:

```
sudo xbps-install pipewire wireplumber
```

For Firefox video/portal support:

```
sudo xbps-install xdg-desktop-portal xdg-desktop-portal-wlr
```

In `~/.config/sway/config`, only add **one** exec line — pipewire auto-spawns wireplumber and pipewire-pulse itself:

```
exec pipewire
exec /usr/libexec/xdg-desktop-portal-wlr
exec sleep 1 && /usr/libexec/xdg-desktop-portal
```

**Do NOT add** `exec wireplumber` or `exec pipewire -c pipewire-pulse.conf` — Void's pipewire package handles those via `/etc/pipewire/pipewire.conf.d/`. Running them manually causes duplicates that crash each other and kill audio.

---

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
