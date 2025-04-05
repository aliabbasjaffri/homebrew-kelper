# Formula/kelper.rb
class Kelper < Formula
  desc "A CLI tool for Kelper" # Update description
  homepage "https://github.com/your-username/kelper" # Update repository URL
  version "{{version}}" # This will be updated by the action
  license "MIT" # Or your actual license

  on_macos do
    if Hardware::CPU.intel?
      url "{{amd64_url}}" # This will be updated by the action
      sha256 "{{amd64_sha256}}" # This will be updated by the action
    end
    if Hardware::CPU.arm?
      url "{{arm64_url}}" # This will be updated by the action
      sha256 "{{arm64_sha256}}" # This will be updated by the action
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
