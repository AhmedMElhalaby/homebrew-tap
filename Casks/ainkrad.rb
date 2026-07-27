cask "ainkrad" do
  version "0.10.0"
  sha256 "aafed811e8702c05bba07eac406de552be5852412fda26aaaa93a035bd352134"

  url "https://github.com/AhmedMElhalaby/Ainkrad/releases/download/v#{version}/Ainkrad-#{version}.dmg"
  name "Ainkrad"
  desc "Agentic OS workspace for software engineers"
  homepage "https://github.com/AhmedMElhalaby/Ainkrad"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Ainkrad.app"

  # Ainkrad is not notarized: notarization requires a paid Apple Developer
  # Program membership. Without `--no-quarantine`, macOS blocks the app and the
  # user has to allow it by hand in System Settings > Privacy & Security.
  #
  #   brew install --cask --no-quarantine ahmedmelhalaby/tap/ainkrad
  #
  # The README says the same thing. This is the honest trade: you are trusting
  # this tap and this GitHub release rather than Apple's notarization service.
  caveats <<~CAVEATS
    Ainkrad is not notarized (that needs a paid Apple Developer account).

    If you installed WITHOUT --no-quarantine and macOS blocks the app, either:
      xattr -dr com.apple.quarantine "/Applications/Ainkrad.app"
    or reinstall with:
      brew install --cask --no-quarantine ahmedmelhalaby/tap/ainkrad

    Plugin code signatures are not verified in an unsigned build — the app
    says so in its App Store surface. Downloads are still checked against the
    catalog's SHA-256.
  CAVEATS

  zap trash: [
    "~/Library/Application Support/com.ainkrad.app",
    "~/Library/Preferences/com.ainkrad.app.plist",
    "~/Library/Caches/com.ainkrad.app",
  ]
end
