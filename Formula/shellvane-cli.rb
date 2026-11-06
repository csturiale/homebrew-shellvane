class ShellvaneCli < Formula
  desc "Command-line companion of Shellvane: list and open saved hosts"
  homepage "https://termoraplus.com"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    depends_on arch: :arm64
    url "https://termoraplus.com/downloads/v#{version}/shellvane-cli-macos-arm64"
    sha256 "6eac16fc7cc9cee8e70131ea6b2fae3966ca31324d029e6567d1513e7655cee2"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://termoraplus.com/downloads/v#{version}/shellvane-cli-linux-amd64"
    sha256 "9e5ac6a9921d8f403ccba657bd81d029c4a1e684efa99bae72f6e37c2a942308"
  end

  livecheck do
    url "https://termoraplus.com/downloads/latest.json"
    strategy :json do |json|
      json["version"]
    end
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
