cask "bedrock-meter" do
  version "1.2.0"
  sha256 "804ac840bf34d6dc983ec46d4392eeebd47d6e35be7b36b1a55c7b913de8be21"

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
