class Tapsilat < Formula
  desc "Omnichannel payments CLI for Tapsilat"
  homepage "https://tapsilat.com"
  version "2025.10.09.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/tapsilat/tapsilat-cli/releases/download/v#{version}/tapsilat-cli_darwin_arm64.tar.gz"
      sha256 "a5c8ec1236dff53f2339625bd8fb57ae6cac7a13eed391f0e3df768c701f991d"
    elsif Hardware::CPU.intel?
      url "https://github.com/tapsilat/tapsilat-cli/releases/download/v#{version}/tapsilat-cli_darwin_amd64.tar.gz"
      sha256 "82bb655bd71ace8cb3dad961efc0e62174b7764ebb1149f0d6869ad5c50dfa3d"
    else
      odie "Unsupported macOS architecture"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/tapsilat/tapsilat-cli/releases/download/v#{version}/tapsilat-cli_linux_arm64.tar.gz"
      sha256 "4a292bd5dd14d336f0cb6da2df563e0cb804ba0fd31180219f20434aaf321c87"
    elsif Hardware::CPU.intel?
      url "https://github.com/tapsilat/tapsilat-cli/releases/download/v#{version}/tapsilat-cli_linux_amd64.tar.gz"
      sha256 "85a91a8026c9e22a0be64d7905aed1f76472f3c776212eccf88a6b3d46884fbb"
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
