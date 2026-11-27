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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.97/rystic_0.0.97_darwin_arm64.tar.gz"
      sha256 "477795500b9b6dff99afab6f3e1a386d84d018470975c762dd8e23b8dace278c"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.97/rystic_0.0.97_darwin_amd64.tar.gz"
      sha256 "d5ab1c83550be93a3580818bccf1ea361187d6a580cfe30a632829bb77b8ca8e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.97/rystic_0.0.97_linux_arm64.tar.gz"
      sha256 "460d5da455eeb60a8b28ccffb189f7b66523f50159d5f8ca29f2ae645c4ebc00"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.97/rystic_0.0.97_linux_amd64.tar.gz"
      sha256 "db37479c2a0a2aad0ff9c2886bad8338a91e637f81ff0e4de7cba884b6195e5e"
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
