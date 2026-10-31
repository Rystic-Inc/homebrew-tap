class Rystic < Formula
  desc "Run stateful simulators of real APIs for agent testing"
  homepage "https://www.rystic.ai/"
  license :cannot_represent

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.34/rystic_0.0.34_darwin_arm64.tar.gz"
      sha256 "cc8a2b991354202967b8056b6f2d390ef7dad600fe758f500bd873b230e323fb"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.34/rystic_0.0.34_darwin_amd64.tar.gz"
      sha256 "9b055048ca6ccbec8e7fb837fffa6feaaf6e105d455cc0ba6310d013db254562"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.34/rystic_0.0.34_linux_arm64.tar.gz"
      sha256 "37ec767ef46160874622efafa123b8a6802962c2cc7ce4c97bf0918549939779"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.34/rystic_0.0.34_linux_amd64.tar.gz"
      sha256 "49d2268fa2cdc0c38d77b51b460c6b2030d1b57cab7ca3474f2b7aaec3f79642"
    end
  end

  def install
    bin.install "rystic"
  end

  def caveats
    <<~EOS
      Upgrade with `brew upgrade rystic`, not `rystic self-update`.

      If macOS says Apple could not verify rystic, clear the download
      quarantine after each install or upgrade, before running rystic:
        chmod u+w #{opt_bin}/rystic
        xattr -d com.apple.quarantine #{opt_bin}/rystic
      If macOS already moved rystic to the Trash, run `brew reinstall rystic`
      first.
    EOS
  end

  test do
    assert_match "rystic #{version}", shell_output("#{bin}/rystic --version")
  end
end
