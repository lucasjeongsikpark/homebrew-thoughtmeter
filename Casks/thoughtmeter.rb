cask "thoughtmeter" do
  version "0.2.0"
  sha256 "20fa9257a90ca4736665dd68d3d1c9fdf84db086123c64327c37ede8d6339dcd"

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
