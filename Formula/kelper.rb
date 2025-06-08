# Formula/kelper.rb
class Kelper < Formula
  desc "A CLI tool for Kelper"
  homepage "https://github.com/aliabbasjaffri/kelper"
  version "v0.0.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.28/kelper-x86_64-apple-darwin"
      sha256 "a0ba0b6bc5fff1bec8fbae55f49513c57be393a09265b58b98ea0999da33c80c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.28/kelper-aarch64-apple-darwin"
      sha256 "e920ea6fb3657c3af80e9149c7fa0a5921fb733b3cc46b2067a820e8de957aab"
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
