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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.74/rystic_0.0.74_darwin_arm64.tar.gz"
      sha256 "3b60a5fc95c4524f6cb92f7cabbe36f43b0f83734b59d646c13061e4cf169b0b"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.74/rystic_0.0.74_darwin_amd64.tar.gz"
      sha256 "17a1951dc7b0ea7279524f7634f1cc118c0e4ac6f8293935a4b030b408d562f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.74/rystic_0.0.74_linux_arm64.tar.gz"
      sha256 "1dcbbeb298ee16865ff8b9437e5e08910b999bccfd555b1422596320c3fb5554"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.74/rystic_0.0.74_linux_amd64.tar.gz"
      sha256 "393c48f276a311d6d8c366fd984ea424fa1e4c7bcd0e2274f467457e4500f110"
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
