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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.91/rystic_0.0.91_darwin_arm64.tar.gz"
      sha256 "8d1dd64d254f2c495da3463cbbf54d08a383327c8a7b2b60e81b1bc84c8323ac"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.91/rystic_0.0.91_darwin_amd64.tar.gz"
      sha256 "d7024cfac3ea565f9e40f50e3c063dd1b45b0d733a72ec09220d35a35a9334a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.91/rystic_0.0.91_linux_arm64.tar.gz"
      sha256 "e009dca466e1222860f8a4bc69bf6a575903a3357e22b1f1948aeaaabb0b3b58"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.91/rystic_0.0.91_linux_amd64.tar.gz"
      sha256 "a34cb1e8be672bec5c7dc1e7c971b432bd700502a3f9faeb659fd5690ae17bdd"
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
