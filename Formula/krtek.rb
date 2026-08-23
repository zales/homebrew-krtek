# krtek 0.9.1. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.9.1"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.9.1"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "23d07461b09e6826428374dc55a146ddba6f9ff2891e06e681be61072dbb4dd7"
    sha256 cellar: :any, sequoia: "04884b15a2d237a5cb4ae09d21ff697903b1ee20b99b9346db7ff699d19aff14"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.1/krtek-v0.9.1-macos-arm64.tar.gz"
      sha256 "fed8f4ccb813df7b0040a0fbc6f053c8f6084b843942d22075e7860bb1f1bc55"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.1/krtek-v0.9.1-macos-x86_64.tar.gz"
      sha256 "d0ebecdd0dd9254aff4ef7d85a12559084506bf247e93ae0e4e79647e0999e9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.1/krtek-v0.9.1-linux-arm64.tar.gz"
      sha256 "bb523afc7db9a381b9465bb56998b3f270dcd55704fb42eff8f9dbd18cf050dc"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.1/krtek-v0.9.1-linux-x86_64.tar.gz"
      sha256 "9b91159aa7b0b7ed31dc99083d110985b4d5616f1c4e14aced4d9c8adbc7a715"
    end
  end

  def install
    bin.install "krtek"
    man1.install "krtek.1"
    doc.install "README.md", "LICENSE"
  end

  test do
    # Not much can be tested without a terminal, but this proves the binary runs
    # on this machine, which is the thing a downloaded binary has to prove.
    assert_match "database manager for the terminal", shell_output("#{bin}/krtek --help")
  end
end
