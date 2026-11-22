cask "docket-seo" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.166"
  sha256 arm:   "fa9e779591ef49eb1c13f469ecd093ec4c3446e4ec0ad2670f474ef6c49131dc",
         intel: "284184302eb7a56ef712f4b583a9e1309cd328d0fb7c0b6f85df6b5b9e4a48b6"

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
