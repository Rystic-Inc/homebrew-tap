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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.90/rystic_0.0.90_darwin_arm64.tar.gz"
      sha256 "c7f6379f7989e7410d6cd9f388622b2e0aaeeac396d30e9fb1fec6c102b41f03"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.90/rystic_0.0.90_darwin_amd64.tar.gz"
      sha256 "d9ee5718aed4300212c9857df52c65eb8d295a77acc03f9b315c90c485843a2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.90/rystic_0.0.90_linux_arm64.tar.gz"
      sha256 "d2ab197e089200837fe0f19316a145f9cb83335cdbdee210dd328f947b205cd9"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.90/rystic_0.0.90_linux_amd64.tar.gz"
      sha256 "47c49e6ce92b3cdd73b737d421b9bbae60235f019e45ce4b7e9f0bf82c77a2f7"
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
