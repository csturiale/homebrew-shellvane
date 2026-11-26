class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://shellvane.com"
  version "0.2.6"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://shellvane.com/downloads/v#{version}/shellvane-cli-macos-arm64"
    sha256 "c034aea0c5c425745d8eab70a94d1283876b8ec8ed3870bea6864152f69f88ab"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://shellvane.com/downloads/v#{version}/shellvane-cli-linux-amd64"
    sha256 "a521f978962ac87e4977e7d74facc9c136a15d3721b22fb5f48b8bbcd22dd644"
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
