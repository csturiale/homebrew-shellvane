class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://shellvane.com"
  version "0.2.0"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-cli-macos-arm64"
    sha256 "3374e3ec30a33687666f611667cf5217ee2ccebecd44251eefe36368f65f1765"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-cli-linux-amd64"
    sha256 "fbd4e3b6db873eff183149a97080c6b63141db32f750d70d937c205a87cdb1a3"
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
