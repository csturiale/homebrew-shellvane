class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://shellvane.com"
  version "0.2.7"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://shellvane.com/downloads/v#{version}/shellvane-cli-macos-arm64"
    sha256 "d8c933dc3af79b4b6176e0566acde9ead376f785966a3a11436355cdd821335a"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://shellvane.com/downloads/v#{version}/shellvane-cli-linux-amd64"
    sha256 "2ce1691127b8479a2034f3371d16f8e4729e9d2aea36ec776071f08bd2109fa7"
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
