cask "shellvane" do
  version "0.2.3"
  sha256 "47c3c5f6a319e0511febdb1bc6b115098f0ec7e76878373a2f1956c2c63b9c63"

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
