cask "bedrock-meter" do
  version "1.3.0"
  sha256 "b64ef866a626c4c26176ab95feda5ea53444ee89c65c45682051c4f5bb4a8226"

  url "https://github.com/mehaxan/claude-quota-tracker/releases/download/v#{version}/BedrockMeter.dmg"
  name "BedrockMeter"
  desc "Menu bar app for tracking Claude usage quota"
  homepage "https://github.com/mehaxan/claude-quota-tracker"

  app "BedrockMeter.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/BedrockMeter.app"]
  end

  caveats <<~EOS
    BedrockMeter is signed ad-hoc only (not notarized by Apple).
    This cask strips the quarantine flag after install so Gatekeeper
    won't refuse to open it, but macOS may still show a first-launch warning.
  EOS
end
