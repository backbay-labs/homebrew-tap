class H2h < Formula
  desc "CLI for validating, testing, and enforcing HushSpec policies"
  homepage "https://github.com/backbay-labs/hush"
  version "1.0.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/backbay-labs/hush/releases/download/v1.0.0/h2h-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "e08cbb6c181d52ec67253a38f336e35cfce3386c194304cffeca6bd304b2935d"
    end
    on_intel do
      url "https://github.com/backbay-labs/hush/releases/download/v1.0.0/h2h-v1.0.0-x86_64-apple-darwin.tar.gz"
      sha256 "fe4e12461ee9a1b75e20b31a0cdc843901dd70325226cb6c763684d4793ce511"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/backbay-labs/hush/releases/download/v1.0.0/h2h-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a9653eaec4eda96fe1e395e06b87b8c13e2e292fe1e191b7e82b06435ba7718"
    end
    on_intel do
      url "https://github.com/backbay-labs/hush/releases/download/v1.0.0/h2h-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e461aae9b981defe5a246313fc4236d8f97336aa403b17b95ecd860c27e1109"
    end
  end

  def install
    bin.install Dir["h2h-*/h2h"].first || "h2h"
  end

  test do
    system "#{bin}/h2h", "--version"
  end
end
