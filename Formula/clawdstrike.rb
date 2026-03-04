class Clawdstrike < Formula
  desc "Runtime security enforcement for AI agents"
  homepage "https://github.com/backbay-labs/clawdstrike"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-aarch64.tar.gz"
      sha256 "df999dab558ba10dcaac688c4505ae6d014e78c9c669990a1e84368fd977d3c4"
    else
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-x86_64.tar.gz"
      sha256 "b576f60b1427d2b0621633c6114a2c70a4a6e3f2c4e014788faabed2b00e4af0"
    end
  end

  on_linux do
    url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-linux-x86_64.tar.gz"
    sha256 "e314ebd0cd1788b44162d426c13a790c0fa0a263e95335ca55475a662171bf22"
  end

  def install
    bin.install "hush"
    bin.install "clawdstrike"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hush --version")
  end
end
