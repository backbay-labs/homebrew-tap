class Clawdstrike < Formula
  desc "Runtime security enforcement for AI agents"
  homepage "https://github.com/backbay-labs/clawdstrike"
  version "0.2.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-aarch64.tar.gz"
      sha256 "0cf2954e7b997d933b49280ae98d80ecb4da450362d3f51ed257bf8191eea71c"
    else
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-x86_64.tar.gz"
      sha256 "ba7460ed54980e45d82a0c6d4365dc7e3057890daf869d8962155c8cf8e97fb2"
    end
  end

  on_linux do
    url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-linux-x86_64.tar.gz"
    sha256 "ab6463306f93669ae0c6b3c3695e2deaf05e3e4fecfaea67826baa23d8cadc83"
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
