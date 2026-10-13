# krtek 0.19.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, MQTT, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.19.0"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.19.0"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "4884ea23c7c66dfb542739358e3aac511e4001d2e4807a13cd8f5b9b8e8ff877"
    sha256 cellar: :any, sequoia: "0b1c9d944483f287baf4e896fccbb8ffef92c8c64fb9d2e758961fd188ad62df"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.19.0/krtek-v0.19.0-macos-arm64.tar.gz"
      sha256 "c0ae19f775d78132926f12b001d50763e4c1f0bc784301ba8793fe9d7ece6d30"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.19.0/krtek-v0.19.0-macos-x86_64.tar.gz"
      sha256 "fa32f6db7cbf4b818f32b993a814780cf5491c2779826cabd6f4bae84fd33e39"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.19.0/krtek-v0.19.0-linux-arm64.tar.gz"
      sha256 "c13ae04f6d98bc74637dc22d927ade6d72c6e7e287b7fd6e4644d8a794ce7f44"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.19.0/krtek-v0.19.0-linux-x86_64.tar.gz"
      sha256 "7daaf4460a45e93f22f63a9380d0c0703ab4b6a7f28c26e90aa5a4df4f6547b6"
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
