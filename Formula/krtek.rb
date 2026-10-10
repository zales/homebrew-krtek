# krtek 0.18.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, MQTT, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.18.0"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.18.0"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "bc383af2f641707921bbd2d44354c8c7a79ad70e85fde41c2f1b773239aad612"
    sha256 cellar: :any, sequoia: "006e9ff5e8f27adec3640775a978853584de9c7787513961ee70ab66a25cc88a"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.18.0/krtek-v0.18.0-macos-arm64.tar.gz"
      sha256 "c2464dd3b7ec99c3002ae657f6609422d5f6b6954190fdf347c55a89a4e9632e"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.18.0/krtek-v0.18.0-macos-x86_64.tar.gz"
      sha256 "099de1e7d25be1e00ea21c96ec59251b17941cc2d0823a5d7e3cfd16767198d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.18.0/krtek-v0.18.0-linux-arm64.tar.gz"
      sha256 "9a0ddfe1825662a58efb294417da05098f2a052a370033b27536809d4ec8cc72"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.18.0/krtek-v0.18.0-linux-x86_64.tar.gz"
      sha256 "4e7e7d29ec57f7ab3ed77fedc5ae1093e7b73ccfab2de6b92567d415e5bbcb20"
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
