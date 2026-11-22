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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.82/rystic_0.0.82_darwin_arm64.tar.gz"
      sha256 "a65768d7204cf551c6ceaa06d571535f7033d0dcfbd6c9452e140c89df9d31fd"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.82/rystic_0.0.82_darwin_amd64.tar.gz"
      sha256 "e4c3b81137be16904b69254cdca1d71ad9bd282b6b1b4c390dfbc79e1f9fdd38"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.82/rystic_0.0.82_linux_arm64.tar.gz"
      sha256 "7386ceecc5144229abb74d2b3564ce57ca83ec415c3f50e88a3d1fbb82a16fee"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.82/rystic_0.0.82_linux_amd64.tar.gz"
      sha256 "12b7a62c0acc9de41ac9509790a86f9cf984be8a42b36a0fb41b6bc92ae70b27"
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
