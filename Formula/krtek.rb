# krtek 0.19.1. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, MQTT, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.19.1"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.19.1"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "e155d3f64e6fed2ecdafa17c012d3df6f0869fae562821aac5692f06e16b1ce5"
    sha256 cellar: :any, sequoia: "1ac4f42698d46e8a1f0fe2efdb41154611e5311c415def47c30c8b61c22d0645"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.19.1/krtek-v0.19.1-macos-arm64.tar.gz"
      sha256 "0040a85f6abfcc9058f4259e219a35c859111494d588a3a8015751ba5d52d266"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.19.1/krtek-v0.19.1-macos-x86_64.tar.gz"
      sha256 "bddc0939600be3884bd8885802450368156a652af345903caae4cfd8d32b7fb8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.19.1/krtek-v0.19.1-linux-arm64.tar.gz"
      sha256 "621abe79123fef09b09dc2de5ab245331d20d0d49abeac9933bb234de0450754"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.19.1/krtek-v0.19.1-linux-x86_64.tar.gz"
      sha256 "2d0b12aa00654d3edb5bd3ba9e8b5dc592e13dc756e45d4e7cb247218b05329a"
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
