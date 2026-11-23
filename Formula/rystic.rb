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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.87/rystic_0.0.87_darwin_arm64.tar.gz"
      sha256 "b1a041a6fd04df4f4e241b0bb7d4b204076151551252444451618d7531ce6f99"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.87/rystic_0.0.87_darwin_amd64.tar.gz"
      sha256 "5b5b5b8f8b30bbf72b824f932f52df8f83c4f6d15bea9a48231b636c4cbb075f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.87/rystic_0.0.87_linux_arm64.tar.gz"
      sha256 "6e491a76269c9fc58dc9e6cb7fac07ce8ab99575a165216ad290f2b6ec7f2560"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.87/rystic_0.0.87_linux_amd64.tar.gz"
      sha256 "a65d2263723ea54d8552fb1f79cf7244b8785abec4b66dcbd7231513fb83b037"
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
