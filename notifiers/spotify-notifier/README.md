Enable this service by executing the following commands:

```bash
ln -s ~/dotfiles/notifiers/spotify-notifier/spotify-notifier.service ~/.config/systemd/user/spotify-notifier.service
systemctl --user enable spotify-notifier
systemctl --user start spotify-notifier
```
