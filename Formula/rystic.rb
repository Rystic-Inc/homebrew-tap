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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.85/rystic_0.0.85_darwin_arm64.tar.gz"
      sha256 "c8f844af833ed946f9d32b951df884866eabfe78f3b7555667d5e75a750d39b4"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.85/rystic_0.0.85_darwin_amd64.tar.gz"
      sha256 "d12f037e9c0a2dc320f059c9b0ec1a4cfef49b800ac5927aed2dae70068c95ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.85/rystic_0.0.85_linux_arm64.tar.gz"
      sha256 "1f0f0337f5006cbfc368bdc6e08a21750733edb41abe78e53ee91a00f3916338"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.85/rystic_0.0.85_linux_amd64.tar.gz"
      sha256 "7aeee3fb66b1707f42819b0387d1d0a9aa0866fca43980cea0e884900e854c63"
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
