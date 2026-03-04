class Clawdstrike < Formula
  desc "Runtime security enforcement for AI agents"
  homepage "https://github.com/backbay-labs/clawdstrike"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-aarch64.tar.gz"
      sha256 "2b6b06441fdb9be4c896da76b2752642c7676fdcc8bb25a08831485f75a1739d"
    else
      url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-darwin-x86_64.tar.gz"
      sha256 "b4f208ecc94899c3fa3f1b9341d589b8c0ec3650c8beb7ba086458f8da63cb56"
    end
  end

  on_linux do
    url "https://github.com/backbay-labs/clawdstrike/releases/download/v#{version}/clawdstrike-linux-x86_64.tar.gz"
    sha256 "ca05194bff617a12948a424985b5ace3a3fcbe39bcf8a49eea2716847fc52ae5"
  end

  def install
    bin.install "hush"
    bin.install "clawdstrike"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hush --version")
  end
end
