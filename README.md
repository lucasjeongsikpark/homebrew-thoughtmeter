# homebrew-thoughtmeter

Homebrew tap for [ThoughtMeter](https://github.com/lucasjeongsikpark/thoughtmeter) —
a local-first macOS menu bar app that counts keystrokes inside the AI tools you
choose. Counts, never content.

## Install

```bash
brew install --cask lucasjeongsikpark/thoughtmeter/thoughtmeter
```

Requires macOS 14 (Sonoma) or later on Apple Silicon.

ThoughtMeter is **not notarized** (there is no paid Apple Developer membership),
so macOS blocks the first launch: right-click ThoughtMeter.app → **Open** →
**Open**, or approve it under System Settings → Privacy & Security. Please do not
disable Gatekeeper globally.

## Uninstall

```bash
brew uninstall --cask thoughtmeter          # keeps your history
brew uninstall --zap --cask thoughtmeter    # also deletes history and settings
```

## Issues

Report problems against the app itself:
https://github.com/lucasjeongsikpark/thoughtmeter/issues
