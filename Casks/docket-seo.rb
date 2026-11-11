cask "docket-seo" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.163"
  sha256 arm:   "df368c1d9b4cdcdd2c46ee074be4b23715e58b70502ea682c7b4f64df110e4e0",
         intel: "abf96ba7d277967b918311063f01301fbfb7f40bc61ebf4df3410e0dbb859c59"

  url "https://github.com/mattkerr09/docket-site/releases/download/v#{version}/Docket-#{version}-#{arch}.dmg",
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
