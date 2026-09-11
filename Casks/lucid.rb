cask "lucid" do
  version "0.10"
  sha256 "15a9345d98c8700ac1df92e631018184254592cbbc9d2e94728bcc596ddfb841"

  url "https://github.com/ManasvinYadav/Lucid/releases/download/v#{version}/Lucid-#{version}.dmg"
  name "Lucid"
  desc "Keeps the Mac awake with the lid shut while an AI coding agent is working"
  homepage "https://github.com/ManasvinYadav/Lucid"

  depends_on macos: :sonoma
  depends_on arch:  :arm64

  app "Lucid.app"

  uninstall quit:      "com.lucid.app",
            launchctl: "com.lucid.app"

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
