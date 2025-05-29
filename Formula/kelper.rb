# Formula/kelper.rb
class Kelper < Formula
  desc "A CLI tool for Kelper"
  homepage "https://github.com/aliabbasjaffri/kelper"
  version "v0.0.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.27/kelper-x86_64-apple-darwin"
      sha256 "e1a48bce723e16a805c2fbb18b2c1f94c2f2a3b49fa93078ee7219f2d5c240d9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.27/kelper-aarch64-apple-darwin"
      sha256 "a9a455f235bff8c3b50a246cf5e53959aed31df695d36bee43711cada6bddccb"
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
