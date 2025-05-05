# Formula/kelper.rb
class Kelper < Formula
  desc "A CLI tool for Kelper"
  homepage "https://github.com/aliabbasjaffri/kelper"
  version "v0.0.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.26/kelper-x86_64-apple-darwin"
      sha256 "17d07778bb0ab7ff1ce38499ec3a70cffa395a0af86a51d4b1658e17b415d3c5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.26/kelper-aarch64-apple-darwin"
      sha256 "998c8cfd7707e2ed46b35397bd8e1ab0999b39ecab65325275ce9873fdb19fc8"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "kelper-x86_64-apple-darwin" => "kelper"
    elsif Hardware::CPU.arm?
      bin.install "kelper-aarch64-apple-darwin" => "kelper"
    end
  end

  test do
    system "#{bin}/kelper", "--version"
  end
end
