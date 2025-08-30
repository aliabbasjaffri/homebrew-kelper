# Formula/kelper.rb
class Kelper < Formula
  desc "A CLI tool for Kelper"
  homepage "https://github.com/aliabbasjaffri/kelper"
  version "v0.0.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.30/kelper-x86_64-apple-darwin"
      sha256 "4605601df39746bc4c290b9c2497e0ce0f0f935a16f4d89edb6e77c68dde220c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.30/kelper-aarch64-apple-darwin"
      sha256 "fff82cf465de4266431d9cc230884ef7a73def0951457683bd1cc2848d1a780a"
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
