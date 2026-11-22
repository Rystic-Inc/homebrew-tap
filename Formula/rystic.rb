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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.84/rystic_0.0.84_darwin_arm64.tar.gz"
      sha256 "a69bcd503ae64e6b792036ea24abb9ae64884ea512820a7bbe413963efe1e3c5"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.84/rystic_0.0.84_darwin_amd64.tar.gz"
      sha256 "3a5c1314da198f7148279cc4c5ee7c471ef5d42c30cc5dbb381c243a904d22a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.84/rystic_0.0.84_linux_arm64.tar.gz"
      sha256 "2543f16e52b34861781ec7e80729e345fcb6d827f328374e2ebc6f270732cf42"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.84/rystic_0.0.84_linux_amd64.tar.gz"
      sha256 "14b8800bb384f5260a8078dcd95ecb07bfd9865b4087d3dead9067cc659f379a"
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
