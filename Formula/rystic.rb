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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.94/rystic_0.0.94_darwin_arm64.tar.gz"
      sha256 "6b1aeaf88e036814f91097046edd49b2b62959ef4cf480a5922e40cf111e27c6"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.94/rystic_0.0.94_darwin_amd64.tar.gz"
      sha256 "1bff8ff70136408b432a6548b93cb2722791276b7bb4e60b06f02c71c4d9009b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.94/rystic_0.0.94_linux_arm64.tar.gz"
      sha256 "7c2e822cd80dce8a234a1441380f99b4b830893052bdf27bad692adfa4635e91"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.94/rystic_0.0.94_linux_amd64.tar.gz"
      sha256 "b17cc498962bd45eb044bf1cc165c4dae8b57d2ea519ec0330fced96c37405aa"
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
