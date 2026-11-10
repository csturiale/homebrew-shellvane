cask "shellvane" do
  version "0.1.7"
  sha256 "d5d2a1982bbff92171bdae45033679a8b375ba98a5d88c70c6a6907236c3eccd"

  url "https://github.com/csturiale/shellvane/releases/download/v#{version}/shellvane-#{version}-macos-arm64.dmg"
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
