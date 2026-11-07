class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://termoraplus.com"
  version "0.1.3"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-cli-macos-arm64"
    sha256 "5cfb96e97af73b0cf3187e51b5cc2ed96df3f4667965fbd4236327cf2b120344"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-cli-linux-amd64"
    sha256 "355212d768c634a87afac4c1663f8daecc0cd105ea2c8f7b3091f21baecf6e54"
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
