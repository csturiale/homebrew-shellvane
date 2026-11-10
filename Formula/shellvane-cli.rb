class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://shellvane.com"
  version "0.1.7"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-cli-macos-arm64"
    sha256 "fb2954c2661f9b5aa9cc6097b10b6f2d688822fc9cfe4837b2b18598ce0bbe90"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-cli-linux-amd64"
    sha256 "9c127d548414c8b153a7de9f4a048eab436c3e630d784026bbe0fc0053890d8c"
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
