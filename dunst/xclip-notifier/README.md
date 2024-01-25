Enable this service by executing the following commands:

```bash
ln -s ~/dotfiles/dunst/xclip-notifier/xclip-notifier.service ~/.config/systemd/user/xclip-notifier.service
systemctl --user enable xclip-notifier
systemctl --user start xclip-notifier
```
