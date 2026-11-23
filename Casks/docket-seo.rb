cask "docket-seo" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.169"
  sha256 arm:   "75053351c5a42a008eb66d4e9ad4343b4d1f5843954781856698e9d4ac08cc58",
         intel: "ea7a2e8852b2ebc92fa882b60823b9e2511ba6fdc1fa54aa49e8ad073ba4e81e"

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
