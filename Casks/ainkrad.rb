cask "ainkrad" do
  version "0.12.0"
  sha256 "c568b797bcafb758e35a062dc5124e9a4ff6af8d287b902e8e4fa43f3055471b"

  url "https://github.com/AhmedMElhalaby/Ainkrad/releases/download/v#{version}/Ainkrad-#{version}.dmg"
  name "Ainkrad"
  desc "Agentic OS workspace for software engineers"
  homepage "https://github.com/AhmedMElhalaby/Ainkrad"

  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Ainkrad.app"

  # Ainkrad is not notarized — notarization requires a paid Apple Developer
  # Program membership. Without this, macOS quarantines the download and
  # refuses to launch it until the user allows it by hand in System Settings >
  # Privacy & Security.
  #
  # Homebrew 6 removed the `--no-quarantine` flag, so a cask for an unsigned
  # app has to clear the attribute itself. This is exactly the command the user
  # would otherwise run by hand; doing it here makes the install one step
  # instead of three. It is stated plainly in the caveats below rather than
  # done quietly — stripping Gatekeeper's mark is a real security decision, and
  # anyone installing this should know they are making it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Ainkrad.app"],
                   sudo: false
  end

  caveats <<~CAVEATS
    Ainkrad is NOT notarized by Apple — that requires a paid Apple Developer
    Program membership.

    This cask removed the macOS quarantine flag from Ainkrad.app so it will
    launch. That is the same thing you would do by hand:

      xattr -dr com.apple.quarantine "/Applications/Ainkrad.app"

    What you are trusting: this tap and the GitHub release it points at,
    verified by SHA-256 — not Apple's notarization service.

    Plugin code signatures are also not verified in an unsigned build. The app
    says so in its App Store surface. Plugin downloads are still checked
    against the catalog's SHA-256, so the bytes match what was published.
  CAVEATS

  zap trash: [
    "~/Library/Application Support/com.ainkrad.app",
    "~/Library/Preferences/com.ainkrad.app.plist",
    "~/Library/Caches/com.ainkrad.app",
  ]
end
