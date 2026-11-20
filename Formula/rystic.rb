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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.73/rystic_0.0.73_darwin_arm64.tar.gz"
      sha256 "880b8a98f6329af3afb9202ebd622e8881f6b46b41ff073281abbf07bd6b3227"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.73/rystic_0.0.73_darwin_amd64.tar.gz"
      sha256 "213efc7be655a552661e864a63c74779435ab3785e27fd7d16adb3339dc43219"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.73/rystic_0.0.73_linux_arm64.tar.gz"
      sha256 "8a6b97a2c3137d156a231689ed0599dbff6c8dac72aef0395f998780bdaba95c"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.73/rystic_0.0.73_linux_amd64.tar.gz"
      sha256 "85573126ed40cdc3e17fcbbf8f88b1527ada48b171e9d9e959d34b1ababe0705"
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
