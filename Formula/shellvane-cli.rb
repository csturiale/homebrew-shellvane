class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://shellvane.com"
  version "0.2.5"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://shellvane.com/downloads/v#{version}/shellvane-cli-macos-arm64"
    sha256 "a3f57175955d986b98f976afc6fc439de887da60b44edfbc4686d051aba0a5b9"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://shellvane.com/downloads/v#{version}/shellvane-cli-linux-amd64"
    sha256 "a6b9d74e5e2a276783be683ad660aace543a750f8d5dc0e006633d3b667730ae"
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
