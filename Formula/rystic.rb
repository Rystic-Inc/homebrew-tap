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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.93/rystic_0.0.93_darwin_arm64.tar.gz"
      sha256 "9f6e00a83820946f3f299aee17c1d1551bbf1d68ccbd3b403f84d2559c7c3de2"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.93/rystic_0.0.93_darwin_amd64.tar.gz"
      sha256 "b2153a6123a9adcb9c5d36d1fd20e05b72093461dd5693780aa5abfd1b19baf7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.93/rystic_0.0.93_linux_arm64.tar.gz"
      sha256 "f75a7eff6e635e68752f94421f95318d5d55ad60b99aea9c6014d1159411328d"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.93/rystic_0.0.93_linux_amd64.tar.gz"
      sha256 "bf0d439999d65cdbaa6905a99ecd1561c17419d30e33764c1dcc482f6898d269"
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
