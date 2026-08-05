cask "thoughtmeter" do
  version "0.1.2"
  sha256 "7475674c15cd8df41f679d6278e010d0eba76a494dabd0d630f9cc966bc8eb2a"

  url "https://github.com/lucasjeongsikpark/thoughtmeter/releases/download/v#{version}/ThoughtMeter-#{version}.dmg"
  name "ThoughtMeter"
  desc "Local-first menu bar app that counts keystrokes inside the AI tools you choose"
  homepage "https://github.com/lucasjeongsikpark/thoughtmeter"

  # Symbol form, not ">= :sonoma": Homebrew 6 deprecated the string comparison.
  # Both report "macOS >= 14" — verified with brew info, not assumed.
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "ThoughtMeter.app"

  uninstall quit: "org.thoughtmeter.app"

  zap trash: [
    "~/Library/Application Support/Google/Chrome/NativeMessagingHosts/org.thoughtmeter.chromehost.json",
    "~/Library/Application Support/ThoughtMeter",
    "~/Library/Preferences/org.thoughtmeter.app.plist",
  ]

  caveats <<~EOS
    ThoughtMeter is open source and currently distributed without Apple
    notarization (no paid Developer Program membership). On first launch,
    macOS may block the app: right-click ThoughtMeter.app → Open → Open,
    or approve it in System Settings → Privacy & Security.

    ThoughtMeter needs the Input Monitoring permission to count keystrokes.
    You grant it once: releases are signed with a stable certificate, so the
    permission carries over to later versions. If counting ever stops after an
    update, the app says so and links to
    System Settings → Privacy & Security → Input Monitoring.
  EOS
end
