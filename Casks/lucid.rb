cask "lucid" do
  version "0.20"
  sha256 "66b616a166b86d9fb6c7fad3434736c509d171aa1bf14381523a631a59bff55b"

  url "https://github.com/ManasvinYadav/Lucid/releases/download/v#{version}/Lucid-#{version}.dmg"
  name "Lucid"
  desc "Keeps the computer awake with the lid shut while an AI coding agent works"
  homepage "https://github.com/ManasvinYadav/Lucid"

  depends_on arch:  :arm64
  depends_on macos: :sonoma

  app "Lucid.app"

  # quit only: an uninstall directive for launchctl also deletes the login item's plist,
  # and brew upgrade runs uninstall, which switched launch at login off on every upgrade.
  uninstall quit: "com.lucid.app"

  zap trash: [
    "~/.lucid",
    "~/Library/LaunchAgents/com.lucid.app.plist",
    "~/Library/Preferences/com.lucid.app.plist",
  ]

  caveats <<~EOS
    Lucid is ad-hoc signed and not yet notarised, so Gatekeeper will refuse to open
    it until the quarantine flag is cleared. Run this once:

      xattr -dr com.apple.quarantine "#{appdir}/Lucid.app"

    Notarisation needs a paid Apple Developer membership:
    https://github.com/sponsors/ManasvinYadav

    Lid-close support installs a sudoers rule at /etc/sudoers.d/lucid, scoped to
    exactly two pmset argument strings. Remove it from Settings > Privileges before
    uninstalling, or delete it yourself:

      sudo rm -f /etc/sudoers.d/lucid
  EOS
end
