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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.96/rystic_0.0.96_darwin_arm64.tar.gz"
      sha256 "ccea6312a2bb4de31dd54f80a904aecb503bbadd0a97e47a5ab0f09973bc457b"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.96/rystic_0.0.96_darwin_amd64.tar.gz"
      sha256 "db4912c7c13fa8a37d4cac9885da1619a9820febda2464345afa77bc583bf56f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.96/rystic_0.0.96_linux_arm64.tar.gz"
      sha256 "26aa53c98bba0770c30829de8e90d2f46ef46d0af48d333403faefabc26b7787"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.96/rystic_0.0.96_linux_amd64.tar.gz"
      sha256 "0f4f5900921ae4bbf10be0cbf38f131f49ad193314ae56c1928e943c41205261"
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
