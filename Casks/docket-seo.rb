cask "docket-seo" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.158"
  sha256 arm:   "1a2790abf8c3c66f2a2ef7e6733aef6f83484a01500ad42619970f2a8897aee8",
         intel: "a07a8566a89cef92a2c73c5ce25c1cfb3548d8496beb7236cf6a7c122a4c2f66"

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
