class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://shellvane.com"
  version "0.2.1"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-cli-macos-arm64"
    sha256 "8e23016f4550190518e6a3583fd853c4fc194cf5105305d86dac6dce38b20679"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-cli-linux-amd64"
    sha256 "1ffa3f6c84e71fab5fd14677f95e290ddbf20ba2fd250b2f8b64a9e7723d0736"
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
