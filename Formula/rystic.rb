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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.95/rystic_0.0.95_darwin_arm64.tar.gz"
      sha256 "a2372c05cd7eb6a43313b6ce8ea0b86de9f42c96ac54b280df1633c664109132"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.95/rystic_0.0.95_darwin_amd64.tar.gz"
      sha256 "3d369adca594a317fc53364a4cd77684099ff705d71b9679b7b1919999d2e0ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.95/rystic_0.0.95_linux_arm64.tar.gz"
      sha256 "09b1a08b984c40b83407f04bdb16531ad14fa0d2193af611edae6b4bc0ddca2e"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.95/rystic_0.0.95_linux_amd64.tar.gz"
      sha256 "745a95bed907e11c512cd3c9aab9429f6fd16b845d305d1f2d10dea8603af17b"
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
