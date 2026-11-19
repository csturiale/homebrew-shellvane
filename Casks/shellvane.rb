cask "shellvane" do
  version "0.2.5"
  sha256 "f78ebed54bb61b5e07a4d5af0b70774b9a1850b3a1012a3fddab0b2a43bced5d"

  url "https://shellvane.com/downloads/v#{version}/shellvane-#{version}-macos-arm64.dmg"
  name "Shellvane"
  desc "SSH client, terminal and connection manager"
  homepage "https://shellvane.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Shellvane updates itself (Settings > Updates).
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Shellvane.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Shellvane.app"]
  end

  # The data folder (~/Library/Application Support/Shellvane, with the vault)
  # is left alone: delete it by hand to remove the saved hosts and secrets.
  zap trash: [
    "~/Library/Caches/io.github.csturiale.shellvane",
    "~/Library/Preferences/io.github.csturiale.shellvane.plist",
    "~/Library/Saved Application State/io.github.csturiale.shellvane.savedState",
    "~/Library/WebKit/io.github.csturiale.shellvane",
  ]
end
