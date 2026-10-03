# homebrew-lucid

This tap no longer distributes [Lucid](https://github.com/ManasvinYadav/Lucid).

The signed, notarised build is available from
**[Gumroad](https://manasvinyadav.gumroad.com/l/kasww)**. The source is MIT-licensed, and
you can build it yourself for free:

```bash
git clone https://github.com/ManasvinYadav/Lucid.git
cd Lucid && ./build.sh
```

If you installed Lucid through this tap, it keeps working, but no further updates come
from here. To remove it:

```bash
brew uninstall --cask lucid
brew untap manasvinyadav/lucid
```

`brew uninstall` only quits Lucid and deletes the app. To remove its hooks, privilege rule
and data as well, use **Settings → General → Remove Everything…** in Lucid first.
