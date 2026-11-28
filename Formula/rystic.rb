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
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.100/rystic_0.0.100_darwin_arm64.tar.gz"
      sha256 "fa2c024919d180556028efb7a71b3fd8f2b6e6a54fc2d0cb4bb7fdb7eeebf91b"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.100/rystic_0.0.100_darwin_amd64.tar.gz"
      sha256 "729bf2836972f3a8c2bb12ad8b2d380a06fbe377fa2ea11185342111eedfa83f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.100/rystic_0.0.100_linux_arm64.tar.gz"
      sha256 "1be3c2a981929e0342c5836f2e5a674e57f71d55088aa4ef4f79929073609640"
    end
    on_intel do
      url "https://github.com/Rystic-Inc/rystic/releases/download/v0.0.100/rystic_0.0.100_linux_amd64.tar.gz"
      sha256 "aab1153b704dee5c976f17db782b36ebb458ec1b57e0cfff80955a9cd5d770ff"
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
