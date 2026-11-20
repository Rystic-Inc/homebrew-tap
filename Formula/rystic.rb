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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.76/rystic_0.0.76_darwin_arm64.tar.gz"
      sha256 "dc924fd3a709921e729d05eeae667a1a0637492557b75b13f0d62c2579e0e064"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.76/rystic_0.0.76_darwin_amd64.tar.gz"
      sha256 "9015a5ae8266d12127a874d26039744be768f3d659c6f55b7e46972d35cf083f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.76/rystic_0.0.76_linux_arm64.tar.gz"
      sha256 "1971decbb7aa92d394b42775acfb31348a7cb7c7619e0a9009ae2cc0bb7aa321"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.76/rystic_0.0.76_linux_amd64.tar.gz"
      sha256 "7965770c0ad27a437e7ecc7847f8af310a90392bb9bc2728f5212327afb1f98f"
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
