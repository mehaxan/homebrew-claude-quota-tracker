cask "claude-quota-menu-bar" do
  version "1.0"
  sha256 "a98afff4747c3394de19491923f1237fcd2d0a791b2ead67a97f47e622e09778"

  url "https://github.com/mehaxan/claude-quota-tracker/releases/download/v#{version}/ClaudeQuotaMenuBar.dmg"
  name "ClaudeQuotaMenuBar"
  desc "Menu bar app for tracking Claude usage quota"
  homepage "https://github.com/mehaxan/claude-quota-tracker"

  app "ClaudeQuotaMenuBar.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ClaudeQuotaMenuBar.app"]
  end

  caveats <<~EOS
    ClaudeQuotaMenuBar is signed ad-hoc only (not notarized by Apple).
    This cask strips the quarantine flag after install so Gatekeeper
    won't refuse to open it, but macOS may still show a first-launch warning.
  EOS
end
