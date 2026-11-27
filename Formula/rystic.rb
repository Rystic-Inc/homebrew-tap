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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.98/rystic_0.0.98_darwin_arm64.tar.gz"
      sha256 "fa5c348d75a0fc3b758b889302929e67d883bf17616e284f88ff8344eafc9b7f"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.98/rystic_0.0.98_darwin_amd64.tar.gz"
      sha256 "8cf5d60ca22357f95a56e1144fab14f7718183f3235b8cf8c50d49eb3f1548d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.98/rystic_0.0.98_linux_arm64.tar.gz"
      sha256 "62abedee90192093ffcb935e4fb5b2bf2acdde1a48e70fbae2950bb5c7e7f254"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.98/rystic_0.0.98_linux_amd64.tar.gz"
      sha256 "04003e2164ee18b67f5dac49e041911bd400414e68032edc5651299453c7b71c"
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
