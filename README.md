# homebrew-lucid

Homebrew tap for [Lucid](https://github.com/ManasvinYadav/Lucid) — looks asleep, isn't.

```bash
brew install --cask manasvinyadav/lucid/lucid
xattr -dr com.apple.quarantine /Applications/Lucid.app
```

The second line is needed until Lucid is notarised. Homebrew removed its
`--no-quarantine` flag in version 6, so clearing the attribute is now the only route.
Notarisation is the whole of the [sponsor goal](https://github.com/sponsors/ManasvinYadav).
