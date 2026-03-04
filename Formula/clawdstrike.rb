class Clawdstrike < Formula
  desc "Runtime security enforcement for AI agents"
  homepage "https://github.com/backbay-labs/clawdstrike"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-aarch64.tar.gz"
      sha256 "f097a77666329ef1f912d48921e9c285c30536a3ee2595fa4fd9c3d189bb54e6"
    else
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-x86_64.tar.gz"
      sha256 "098f2c9d1323e04fb7851bd5c37656523d5b3003343ffe3635a1bbf62e147598"
    end
  end

  on_linux do
    url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-linux-x86_64.tar.gz"
    sha256 "927e21829fe55df37b58322cffaf155222714242119aecf5f47c459c1a3f578e"
  end

  def install
    bin.install "hush"
    bin.install "clawdstrike"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hush --version")
  end
end
