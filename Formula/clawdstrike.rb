class Clawdstrike < Formula
  desc "Runtime security enforcement for AI agents"
  homepage "https://github.com/backbay-labs/clawdstrike"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-aarch64.tar.gz"
      sha256 "9a74b7fe28c3f22789fd7a11bf9706207cb5ad7dc093921ecf06e75f9b75b807"
    else
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-x86_64.tar.gz"
      sha256 "558096e2267574854f74c7ad4cd12823f153b608750bb068f8248590d7cf06df"
    end
  end

  on_linux do
    url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-linux-x86_64.tar.gz"
    sha256 "4b767a78f80813d86abedca9509d7e5674cbfb10aa48182041f4c79ba1e7b3d3"
  end

  def install
    bin.install "hush"
    bin.install "clawdstrike"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hush --version")
  end
end
