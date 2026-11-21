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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.79/rystic_0.0.79_darwin_arm64.tar.gz"
      sha256 "3cc4ce9210e838944318a976f696daed3b6afa8c80ce8674f0b537f1dd0eda52"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.79/rystic_0.0.79_darwin_amd64.tar.gz"
      sha256 "3c3f651814268ec7d9a24b8f7d4433738707fe2bf23ffe40732ca632d7a61c54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.79/rystic_0.0.79_linux_arm64.tar.gz"
      sha256 "3c45c234b846461237afd743ef9bed96368422d02b6fd14773ac446048b85d09"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.79/rystic_0.0.79_linux_amd64.tar.gz"
      sha256 "cb6a4065dc78a5c3b6f770ca26b625abf2001967dc33c39b4dd47f4e0ea0725a"
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
