cask "docket-seo" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.150"
  sha256 arm:   "cb853493fcc05b89920885043893f60a3970c0bf73c7fbe1d96323b7d59a640d",
         intel: "63b0ffabec4cd5c99565602400810cc5eeb7681068bc3f7a08bd7b58e7d7517b"

  url "https://github.com/mattkerr09/docket-site/releases/download/v#{version}/Docket-#{version}-#{arch}.dmg",
      verified: "github.com/mattkerr09/docket-site/"
  name "Docket SEO"
  desc "Website SEO audit app that runs on your own computer"
  homepage "https://docketseo.app/"

  livecheck do
    url "https://docketseo.app/updater.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "Docket.app"

  uninstall launchctl: "app.docket.watchdog"

  zap trash: [
    "~/.docket",
    "~/Library/Application Support/Docket",
    "~/Library/Caches/app.docket.desktop",
    "~/Library/Caches/app.docketseo.updates",
    "~/Library/LaunchAgents/app.docket.watchdog.plist",
    "~/Library/Preferences/app.docket.desktop.plist",
    "~/Library/WebKit/app.docket.desktop",
  ]
end
