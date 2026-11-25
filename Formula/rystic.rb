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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.92/rystic_0.0.92_darwin_arm64.tar.gz"
      sha256 "58969fa4d51c2fef96d256381c7c999117ecf535fb503a03ca0e0fb84fcfabd6"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.92/rystic_0.0.92_darwin_amd64.tar.gz"
      sha256 "8fb2230f592d36dccaecea735c1d19e5969559a54f28a6a4586f880802143365"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.92/rystic_0.0.92_linux_arm64.tar.gz"
      sha256 "a91819490d9c1b76e5213359b09337ba8518b7e5a349752dfd5ca6e3fdf8d161"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.92/rystic_0.0.92_linux_amd64.tar.gz"
      sha256 "d8472bfc51546f824a3ec0c533a411158198ea8dad745e19c0d6f8394e034b68"
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
