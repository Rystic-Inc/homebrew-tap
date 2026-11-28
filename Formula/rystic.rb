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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.101/rystic_0.0.101_darwin_arm64.tar.gz"
      sha256 "1678a039060a22aa5b9ba7843314dcb8fcd67b0f0766382d50e7e6cb9554e75f"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.101/rystic_0.0.101_darwin_amd64.tar.gz"
      sha256 "c60b6cf06bca9da30b1676d2a1658813cce4a06358985e820b8d283f967fb8b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.101/rystic_0.0.101_linux_arm64.tar.gz"
      sha256 "5d69709e51a54ee27a297c11000f0f29d2d97749a9ca6b86d19e8e398a7655b8"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.101/rystic_0.0.101_linux_amd64.tar.gz"
      sha256 "b912900d1e7e22128d055039c11efabd77c4190b0f0051e8e97eb7760bd4f914"
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
