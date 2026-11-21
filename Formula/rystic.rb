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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.78/rystic_0.0.78_darwin_arm64.tar.gz"
      sha256 "bf6e1ce4f2197d395adca4180a723a9af2759c976777be121b59de1190f16b3f"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.78/rystic_0.0.78_darwin_amd64.tar.gz"
      sha256 "62a1aa445997cd2f4463056f832e4c09ee99b8ea774d5a32eae7e8345b27b15a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.78/rystic_0.0.78_linux_arm64.tar.gz"
      sha256 "af573f285f3fc66322e6732e507a8bc00995c6f37a850165f099a072833ecfd0"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.78/rystic_0.0.78_linux_amd64.tar.gz"
      sha256 "7f2dc201971b80d2c2f9f7f947396ffd8df6a5334976766d3dad96eb2e5ad0e4"
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
