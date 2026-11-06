cask "shellvane" do
  version "0.1.0"
  sha256 "6f2f049c403d7ca21806a85d28cdfae22cbf739a9abfbe5a86910f0afff91895"

  url "https://termoraplus.com/downloads/v#{version}/shellvane-#{version}-macos-arm64.dmg"
  name "Shellvane"
  desc "SSH client, terminal and connection manager"
  homepage "https://termoraplus.com"

  livecheck do
    url "https://termoraplus.com/downloads/latest.json"
    strategy :json do |json|
      json["version"]
    end
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
