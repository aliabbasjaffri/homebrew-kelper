# Formula/kelper.rb
class Kelper < Formula
  desc "A CLI tool for Kelper"
  homepage "https://github.com/aliabbasjaffri/kelper"
  version "v0.0.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.29/kelper-x86_64-apple-darwin"
      sha256 "56236780b97837a0dae04fefab1db9e96bac13170442e333a2e6b94a890dd1a6"
    end
    if Hardware::CPU.arm?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.29/kelper-aarch64-apple-darwin"
      sha256 "6d9b7de081cf8d6d12559605a9d411d39299506d07b34cc38e9621562bccecab"
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
