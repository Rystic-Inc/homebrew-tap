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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.36/rystic_0.0.36_darwin_arm64.tar.gz"
      sha256 "7ac69b0817ecb5b21417a2c2750ee469f33708904c2537532e19237081899f13"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.36/rystic_0.0.36_darwin_amd64.tar.gz"
      sha256 "1f620b05b9d2b416225665bb497a4cf6bec4831c887a27b7994751b2cb450a49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.36/rystic_0.0.36_linux_arm64.tar.gz"
      sha256 "57c2018a31f7d57b784ab237655b2f59f3a4c2b534bc803c59a1d4a5573bd4b4"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.36/rystic_0.0.36_linux_amd64.tar.gz"
      sha256 "48789e0aefe6c021e7275f8482b7803a49ef0accc84e4796cef47977c8bbec20"
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
