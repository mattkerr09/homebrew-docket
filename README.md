# Homebrew tap for Docket SEO

[Docket SEO](https://docketseo.app/) audits a website for SEO problems on your own Mac. This tap installs the app.

```sh
brew install --cask mattkerr09/docket/docket-seo
```

That taps this repository and installs the same signed, notarised app as the download on [docketseo.app/download/](https://docketseo.app/download/). It works on Apple silicon and Intel Macs, macOS 12 or later.

Docket updates itself from inside the app. This cask is kept at the current version so a fresh install starts there.

```sh
brew uninstall --cask docket-seo        # remove the app
brew uninstall --zap --cask docket-seo  # remove the app and the data and caches it made
```

The cask only downloads the release from [github.com/mattkerr09/docket-site](https://github.com/mattkerr09/docket-site/releases) and checks its SHA-256. Questions: support@docketseo.app.
