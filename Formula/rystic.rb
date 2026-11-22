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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.81/rystic_0.0.81_darwin_arm64.tar.gz"
      sha256 "dc15c8fd169145f5843867be4e32ac8c8997d4b7b4919519050a06e602d71d3a"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.81/rystic_0.0.81_darwin_amd64.tar.gz"
      sha256 "79e44e0d74222ba01c2ecb48c686c8ec7fd9f98aadf7a778e3e302b3dfe1306c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.81/rystic_0.0.81_linux_arm64.tar.gz"
      sha256 "8215149ec92141210b26e0455731f4c01658644efb4e4bddad5cf99254334d4f"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.81/rystic_0.0.81_linux_amd64.tar.gz"
      sha256 "992abc01303a96430c29b86fcd6c689be0b8363b7f012c7b582c5d379f5c36e8"
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
