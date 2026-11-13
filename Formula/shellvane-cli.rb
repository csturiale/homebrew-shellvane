class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://shellvane.com"
  version "0.2.2"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://shellvane.com/downloads/v#{version}/shellvane-cli-macos-arm64"
    sha256 "8253d814f51bddc221e10229ed68aecba680c4722673f8be809a442f55f83405"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://shellvane.com/downloads/v#{version}/shellvane-cli-linux-amd64"
    sha256 "3bb3c6f7141d9d9bc0f91d1ddccf9e62501f85ed81e29ed450d197f197255ee1"
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    binary = Dir["shellvane-cli-*"].first
    chmod 0755, binary
    bin.install binary => "shellvane-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/shellvane-cli version")
  end
end
