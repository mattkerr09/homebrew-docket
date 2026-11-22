cask "docket-seo" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.167"
  sha256 arm:   "95bb4df884e4a23236b7c04282b926cdfcf359fe6e7c3f963065e6d10c28e5fd",
         intel: "1214ff7509fcc1487c25a2f0bd8d7dee6ba1557e847ca6c3ce94c4583776ea97"

  url "https://github.com/mattkerr09/docket-site/releases/download/v#{version}/Check-Engine-SEO-#{version}-#{arch}.dmg",
      verified: "github.com/mattkerr09/docket-site/"
  name "Check Engine SEO"
  desc "Website SEO audit app that runs on your own computer"
  homepage "https://checkengineseo.com/"

  livecheck do
    url "https://docketseo.app/updater.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: :monterey

  app "Check Engine SEO.app"

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
