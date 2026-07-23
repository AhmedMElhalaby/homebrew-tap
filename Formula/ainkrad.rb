class Ainkrad < Formula
  desc "Ainkrad agentic OS CLI"
  homepage "https://github.com/AhmedMElhalaby/AinkradKit"
  # PLACEHOLDER — overwritten by AinkradKit/scripts/release-cli.sh on every release.
  version "0.0.0-placeholder"
  url "https://github.com/AhmedMElhalaby/AinkradKit/releases/download/v0.0.0-placeholder/ainkrad-v0.0.0-placeholder-macos.zip"
  # PLACEHOLDER sha256 (64 hex chars) — real value is filled in by release-cli.sh.
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "UNLICENSED"

  def install
    bin.install "ainkrad"
  end

  test do
    system "#{bin}/ainkrad", "--help"
  end
end
