# Formula/kelper.rb
class Kelper < Formula
  desc "A CLI tool for Kelper" # Update description
  homepage "https://github.com/aliabbasjaffri/kelper" # Update repository URL
  version "v0.0.12" # This will be updated by the action
  license "MIT" # Or your actual license

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.12/kelper-x86_64-apple-darwin" # This will be updated by the action
      sha256 "dbafa04a3505b8b7e6b958d3fe530b84f454f85a8b9674a54e7b7a2f6ba6eee1" # This will be updated by the action
    end
    if Hardware::CPU.arm?
      url "https://github.com/aliabbasjaffri/kelper/releases/download/v0.0.12/kelper-aarch64-apple-darwin" # This will be updated by the action
      sha256 "5424c2b2f82b7eb41b3f0a61faa5be6566b69a10efc539152a2d266b0cd553bc" # This will be updated by the action
    end
  end

  def install
    # The downloaded artifact is the binary itself, already named correctly by the build job
    # We just need to install it to the right place based on architecture
    if Hardware::CPU.intel?
      bin.install "kelper-x86_64-apple-darwin" => "kelper"
    elsif Hardware::CPU.arm?
      bin.install "kelper-aarch64-apple-darwin" => "kelper"
    end
  end

  test do
    # Add a basic test command
    system "#{bin}/kelper", "--version"
  end
end
