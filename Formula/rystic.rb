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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.86/rystic_0.0.86_darwin_arm64.tar.gz"
      sha256 "135d6b5586fb82de912274ca0b37f2b0d3aadd7e1aa002f8d70a4d7d8bc19c76"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.86/rystic_0.0.86_darwin_amd64.tar.gz"
      sha256 "05fae7562bcfe9a0c85b586e24d4f8c2ab038a3140c90904ebc4dd15b97b8af6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.86/rystic_0.0.86_linux_arm64.tar.gz"
      sha256 "9f248b13976f27d02437e61c838c99bae65f4618cb1da2e214237f90e3abf864"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.86/rystic_0.0.86_linux_amd64.tar.gz"
      sha256 "be594b64432fe115edcc7a17d4453664343fa43cc7415ca2b626efdd0eda642e"
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
