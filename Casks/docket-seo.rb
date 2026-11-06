cask "docket-seo" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.153"
  sha256 arm:   "ad234c6058f0692f22d8f5cfd3b71b49a792f05e65f22e7cd0ec1e26be6ea6b5",
         intel: "6ff70681387bd732147db21a29a996e78c57452b7fec711aa3ae4b35c49548ea"

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
