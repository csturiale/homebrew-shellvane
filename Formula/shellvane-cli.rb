class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://shellvane.com"
  version "0.2.3"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://shellvane.com/downloads/v#{version}/shellvane-cli-macos-arm64"
    sha256 "00881e8abc89618e1234298299be02c50ca9a62e8ef1cf86727b2805fa350e46"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://shellvane.com/downloads/v#{version}/shellvane-cli-linux-amd64"
    sha256 "a2a9f66fb7be4cf616f0eda8791ec4db99c78ad14c05872b0baf782a2781ebf9"
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
