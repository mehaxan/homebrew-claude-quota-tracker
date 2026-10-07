cask "bedrock-meter" do
  version "1.1.0"
  sha256 "b8e7bc14e35d0ced584b5d42dff6323ca16cbf83c2062aa01863f3ee0e6c2cee"

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
