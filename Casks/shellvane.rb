cask "shellvane" do
  version "0.2.0"
  sha256 "d637347081e693a8edc2287f22e11028b330ed2407ceacb88bad3a4b61145384"

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
