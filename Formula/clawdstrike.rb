class Clawdstrike < Formula
  desc "Runtime security enforcement for AI agents"
  homepage "https://github.com/backbay-labs/clawdstrike"
  version "0.2.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-aarch64.tar.gz"
      sha256 "aae51c49f69c817e1ff4ea94d1a94a1e5d5a44bdb135d86cf9b8f4356465fc5c"
    else
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-x86_64.tar.gz"
      sha256 "0c51dd0c9a6edb8c946d3ecc422fcaff627d889311cd98132fe6bf6b5066e1be"
    end
  end

  on_linux do
    url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-linux-x86_64.tar.gz"
    sha256 "281faf77ac33e093cb1915c3b3e22dfd84ccd5bf5f503d46bdacccbad38104ac"
  end

  def install
    bin.install "hush"
    bin.install "clawdstrike"
    bin.install "hushd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hush --version")
    assert_match "hushd", shell_output("#{bin}/hushd --version")
  end
end
