# krtek 0.15.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, MQTT, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.15.0"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.15.0"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "7b304b96a0c4b1149b6d8289d094e5f9d2f5c600e30793def58eaf5893b5e9f7"
    sha256 cellar: :any, sequoia: "77582e1f0ba89a37c800a57eae43b9679f35eaee76ce9a56b5ec7c7a2130724e"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.15.0/krtek-v0.15.0-macos-arm64.tar.gz"
      sha256 "33bc652fe283947cb1d65009937b95214f05a1b397d2aacf817354793688e3a3"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.15.0/krtek-v0.15.0-macos-x86_64.tar.gz"
      sha256 "e7a5a0c9882716c6a8fc7909808e8b259cee57670d7a1faad087b25f410bc309"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.15.0/krtek-v0.15.0-linux-arm64.tar.gz"
      sha256 "3333bead5f5a13329bfa760e351fd6b0064fe06277a444fca99c9160dc007b5d"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.15.0/krtek-v0.15.0-linux-x86_64.tar.gz"
      sha256 "342bc0facf4d88d02906412464f20914b44e5ffc7c5c53c23c035c898b28ecbc"
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
