class Tapsilat < Formula
  desc "Omnichannel payments CLI for Tapsilat"
  homepage "https://tapsilat.com"
  version "2025.11.05.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tapsilat/tapsilat-cli/releases/download/v#{version}/tapsilat-cli_darwin_arm64.tar.gz"
      sha256 "17f100ea291f6e651b4f09bfc67114d24f87f1e2496a674949b183c66b9ddcfc"
    elsif Hardware::CPU.intel?
      url "https://github.com/tapsilat/tapsilat-cli/releases/download/v#{version}/tapsilat-cli_darwin_amd64.tar.gz"
      sha256 "6b668279a601bf55b21975b37f4273f50aea8f662b65b3e84c381fb57058c9bd"
    else
      odie "Unsupported macOS architecture"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tapsilat/tapsilat-cli/releases/download/v#{version}/tapsilat-cli_linux_arm64.tar.gz"
      sha256 "3ce3dec8d8f5c86f25cc7621a1906ca39e02fe4d0d0c480f10618b6e84559a3d"
    elsif Hardware::CPU.intel?
      url "https://github.com/tapsilat/tapsilat-cli/releases/download/v#{version}/tapsilat-cli_linux_amd64.tar.gz"
      sha256 "2c02c4d008a6600c30fe8a18faca446fe1cdae9bcbc42d8e6f5b31e1225fbf7a"
    else
      odie "Unsupported Linux architecture"
    end
  end

  def install
    suffix = if OS.mac?
      Hardware::CPU.arm? ? "_darwin_arm64" : "_darwin_amd64"
    else
      Hardware::CPU.arm? ? "_linux_arm64" : "_linux_amd64"
    end

    candidates = ["tapsilat", "tapsilat-cli", "tapsilat-cli#{suffix}"]
    binary = candidates.find { |name| File.exist?(name) }

    odie "Unable to locate tapsilat binary in archive" unless binary

    bin.install binary => "tapsilat"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tapsilat --version")
  end
end
