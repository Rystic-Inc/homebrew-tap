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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.80/rystic_0.0.80_darwin_arm64.tar.gz"
      sha256 "3a812942a74299948c18eb4e96a0b75777a7b72e65cfd27bc242a7cb88ef51fc"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.80/rystic_0.0.80_darwin_amd64.tar.gz"
      sha256 "7300043b889ec9b258fde83c20a313f50ef7f61224c38b950e4f8522407b97eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.80/rystic_0.0.80_linux_arm64.tar.gz"
      sha256 "66287d7929608e2e05786549e2737b8d6e93c1a5bf61fc419a679a4f77c6ba3e"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.80/rystic_0.0.80_linux_amd64.tar.gz"
      sha256 "501853fbc97b713930262c1f898649da95d81b00da1d086ef2703b280bac2cc1"
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
