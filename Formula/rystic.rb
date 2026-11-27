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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.99/rystic_0.0.99_darwin_arm64.tar.gz"
      sha256 "f9b2863f36812efeec4c8dc80edaa5d47a78cf988d1af566239ef9b8ddaef104"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.99/rystic_0.0.99_darwin_amd64.tar.gz"
      sha256 "4cde49c5eed94699e19feaa5c5cbd83948d4a66f86af1609201ac17cbc99836a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.99/rystic_0.0.99_linux_arm64.tar.gz"
      sha256 "fd09fc7d2cf73bf8a4a3ae19b00beef7373682a815d6369854fb8c3da0ee13c3"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.99/rystic_0.0.99_linux_amd64.tar.gz"
      sha256 "699c182329952c79a36c869325ed98fff5b9bfdd5f6d00537866f8b4a35a049d"
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
