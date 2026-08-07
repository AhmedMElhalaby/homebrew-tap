class Ainkrad < Formula
  desc "Ainkrad agentic OS CLI"
  homepage "https://github.com/AhmedMElhalaby/AinkradKit"
  version "0.2.0"
  url "https://github.com/AhmedMElhalaby/AinkradKit/releases/download/v0.2.0/ainkrad-v0.2.0-macos.zip"
  sha256 "85d07118457e9f0cd11188deb00325410620a3021fd3bd2dfcf18b920af1aa32"
  license "UNLICENSED"

  def install
    # ainkrad links libAinkradAppKit.dylib via @loader_path, so the two must
    # stay siblings. Install both into libexec and symlink the CLI into bin.
    libexec.install "ainkrad", "libAinkradAppKit.dylib"
    bin.install_symlink libexec/"ainkrad"
  end

  test do
    system "#{bin}/ainkrad", "--help"
  end
end
