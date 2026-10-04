# krtek 0.12.1. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.12.1"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.12.1"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "841af806a60297232985bbc592e9c6665ddce079ab02bfd6de7909de568df734"
    sha256 cellar: :any, sequoia: "0d538039e5464f02c9ba7edce94d70126f85ab960e53dc6bffc0d28074906c55"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.12.1/krtek-v0.12.1-macos-arm64.tar.gz"
      sha256 "0ae2864ecf845a2a1a2771602af6a7510521f77bdef63607c89efa217129b922"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.12.1/krtek-v0.12.1-macos-x86_64.tar.gz"
      sha256 "1a290b1de8fea077720198d83235bc4e376738f22ec3e1941b9c3e54915619e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.12.1/krtek-v0.12.1-linux-arm64.tar.gz"
      sha256 "218fa6bba4dfe0a4ff92f4d04be85f089c6c631e81dcb007ae9e1fc1702d0111"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.12.1/krtek-v0.12.1-linux-x86_64.tar.gz"
      sha256 "05294bb55e84d711a8844069df0b7b15b3b97569bbd63fb83722a06c1119b8a2"
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
