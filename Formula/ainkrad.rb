class Ainkrad < Formula
  desc "Ainkrad agentic OS CLI"
  homepage "https://github.com/AhmedMElhalaby/AinkradKit"
  version "0.1.0"
  url "https://github.com/AhmedMElhalaby/AinkradKit/releases/download/v0.1.0/ainkrad-v0.1.0-macos.zip"
  sha256 "1947ef2479594bb2ec169b81bf41146119bfe6158776f2d4cc7d32a1eccbe669"
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
