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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.83/rystic_0.0.83_darwin_arm64.tar.gz"
      sha256 "d92a1627075b43cd8b6fdc4e3a2cd96da91d549fcc7147fe9cf308ef84660d0b"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.83/rystic_0.0.83_darwin_amd64.tar.gz"
      sha256 "81c84ff74eef0e3b4bf317461d4fb698c219a517f587aa8ca7f2c93247733c46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.83/rystic_0.0.83_linux_arm64.tar.gz"
      sha256 "6385bc908b66dfe6cb5295316181fa613cd679754b546b8fb780aed07c51d604"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.83/rystic_0.0.83_linux_amd64.tar.gz"
      sha256 "5b75b5e17ece19637a1638a7b65423f6a597617d315bef2eb0d5921181c429ac"
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
