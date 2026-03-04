class Clawdstrike < Formula
  desc "Runtime security enforcement for AI agents"
  homepage "https://github.com/backbay-labs/clawdstrike"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-aarch64.tar.gz"
      sha256 "5d2e58667ccbe86014b21530a23244dc4cb2282ed0c72d3c7034a263e82ed1a1"
    else
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-x86_64.tar.gz"
      sha256 "defd26a80ed7735da0351eb9d95006390cf351e6158657fa896b08b6469c6074"
    end
  end

  on_linux do
    url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-linux-x86_64.tar.gz"
    sha256 "e547c1a0af309cdb86ee61ad4afd43df734bcc48aec36b94201083d6844704c3"
  end

  def install
    bin.install "hush"
    bin.install "clawdstrike"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hush --version")
  end
end
