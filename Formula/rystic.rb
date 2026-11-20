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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.75/rystic_0.0.75_darwin_arm64.tar.gz"
      sha256 "db69bf4f77a6400d286a44390f1a1535c59ed9d0e5e048ed92505c222fd5a007"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.75/rystic_0.0.75_darwin_amd64.tar.gz"
      sha256 "00cabef4374eec8c08456e81286409d7d22eddadd2bc7aab85cea135f81c2fd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.75/rystic_0.0.75_linux_arm64.tar.gz"
      sha256 "306d1d23b583d00be18069f23e1905b48d109f6a6426bbbc1f94c9647397d883"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.75/rystic_0.0.75_linux_amd64.tar.gz"
      sha256 "1e9985ad62c3e028c63425be4257fd3a2490ef387dc8a4a6236de86ac2ed3ac6"
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
