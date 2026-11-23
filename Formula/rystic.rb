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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.88/rystic_0.0.88_darwin_arm64.tar.gz"
      sha256 "7d670d2b057eb55f6fbea7f1a07e9caf1d4081ec43f46bb446e6a1423d2edcdc"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.88/rystic_0.0.88_darwin_amd64.tar.gz"
      sha256 "89c1811787abb3a126dae5b1a09c5cd031e4468a6f0a212a29206f8763e3e150"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.88/rystic_0.0.88_linux_arm64.tar.gz"
      sha256 "839077abe514fa1c30f0ed296dd94f391a6b6572d7917d07b5ee749c8aae3b79"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.88/rystic_0.0.88_linux_amd64.tar.gz"
      sha256 "35e5bb5c0bcdbd2b9cba3537d6d63c887e509ccc7cfd1b1c04920b0ad0063252"
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
