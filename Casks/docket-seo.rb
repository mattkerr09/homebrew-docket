cask "docket-seo" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.156"
  sha256 arm:   "915c749e1fc7f389dbd1ba06f6f576fdb5b25c786c9daa1a1e762cf82544b2a0",
         intel: "bad4b6dd8cb23b2f7fead4a73a1dda14452aeb3e66714673f09f36a2bdc0e230"

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
