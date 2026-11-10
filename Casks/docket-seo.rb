cask "docket-seo" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.160"
  sha256 arm:   "963d3f50f8f7965ed8360905a091c50980538a97d35d43e4c08713dbe7fe0dd9",
         intel: "9453821e05dc324f82e209bea4732d7fc1346c9063827d818fb7e9b1c5a22fb1"

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
