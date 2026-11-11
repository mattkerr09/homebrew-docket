cask "docket-seo" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.162"
  sha256 arm:   "83116605fce72aeab8888de3ea0a7890241b7596e3139f381dc8b0d514433323",
         intel: "3c496c5129690aaebbff2d7846d42af156b272b347c7966a895a1abca9462f83"

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
