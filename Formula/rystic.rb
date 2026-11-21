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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.77/rystic_0.0.77_darwin_arm64.tar.gz"
      sha256 "3b797d35a7554cd921453fda5c9964163d56459636557769dfaf94d4a2e6737c"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.77/rystic_0.0.77_darwin_amd64.tar.gz"
      sha256 "2e4e0603624f5c998d9a8c092752db09cb684a356be3a473ac6b61439eadfd9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.77/rystic_0.0.77_linux_arm64.tar.gz"
      sha256 "2c01e93abc1c4e6936a108291affaed8489989593764508ddb195ea138b5091b"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.77/rystic_0.0.77_linux_amd64.tar.gz"
      sha256 "02c64a8a7c61f155a39c682bb25576722156539c20674723c6156c713fa9ee2b"
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
