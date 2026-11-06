class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://termoraplus.com"
  version "0.1.1"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-cli-macos-arm64"
    sha256 "884cbcebb529f81a0516eada59f9825f57abbc4223e5aa9c9e8033254492c044"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-cli-linux-amd64"
    sha256 "aeff6326060f9dfe7850ec05c40f403efd961ee43c438b98ed3147fdd042d2bb"
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
