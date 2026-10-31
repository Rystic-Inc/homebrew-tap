# Rystic Homebrew tap

Install the Rystic CLI, which runs stateful simulators of real APIs for agent testing:

```sh
brew install rystic-inc/tap/rystic
```

Upgrade with `brew upgrade rystic`. Docs: https://www.rystic.ai/docs. Support: help@rystic.ai.

## macOS: "Apple could not verify rystic"

The macOS binaries are not notarized, so macOS can refuse to run a copy Homebrew downloaded. After each install or upgrade, before running `rystic`, clear the download quarantine:

```sh
chmod u+w "$(brew --prefix rystic)/bin/rystic"
xattr -d com.apple.quarantine "$(brew --prefix rystic)/bin/rystic"
```

If macOS already moved `rystic` to the Trash, run `brew reinstall rystic`, then the two commands above.
