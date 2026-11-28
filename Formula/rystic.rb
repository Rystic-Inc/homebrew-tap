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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.102/rystic_0.0.102_darwin_arm64.tar.gz"
      sha256 "235c4da70c6808c5e8d650c8fe4846c5d35cc525844690a36860d983707df1b8"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.102/rystic_0.0.102_darwin_amd64.tar.gz"
      sha256 "eb111556168d1b7d17fe7acf51f3fbc9ae053dc828169fe2f9d7de5c0bbd2eae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.102/rystic_0.0.102_linux_arm64.tar.gz"
      sha256 "ea7ec4026a4a5bf12e9244023117bc8124e4c43f2175e6fc15d543d57cf9453e"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.102/rystic_0.0.102_linux_amd64.tar.gz"
      sha256 "281c877b14084afd93705a8dc0f380d9aa15ba24f5245d7dc61ae67d1024ecad"
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
