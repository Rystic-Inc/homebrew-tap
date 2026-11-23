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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.89/rystic_0.0.89_darwin_arm64.tar.gz"
      sha256 "e91e7f33e92c175b065899c3537b8766bb2f347813ee1fddeb67534bd4e456aa"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.89/rystic_0.0.89_darwin_amd64.tar.gz"
      sha256 "80472f15b41095dd92afc193249c6eaecc6ccbb670c0ac02fb6ae16296c1def7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.89/rystic_0.0.89_linux_arm64.tar.gz"
      sha256 "be602c5be40daa68f3dee82134318e32c1499eeb865e70adcfd74b3eab8354eb"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.89/rystic_0.0.89_linux_amd64.tar.gz"
      sha256 "16dddb6100258b199f8cd522706a54487697d8a8355bd844f2bfa0d70bfb2713"
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
