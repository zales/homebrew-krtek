# krtek 0.16.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, MQTT, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.16.0"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.16.0"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "a0be3deb2bdc77faa3d36cb2fe76cec6472b5263cddab1c91dcab9992c60f8fd"
    sha256 cellar: :any, sequoia: "e939144f4691590cd349d89661afa3ccc0ec84cf6a9a320c879372ee7860abd2"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.16.0/krtek-v0.16.0-macos-arm64.tar.gz"
      sha256 "a89a419c84ba10b7df45d2599430bba7a09c13fb19a7eb22f6bdf0a09bba961e"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.16.0/krtek-v0.16.0-macos-x86_64.tar.gz"
      sha256 "418a49c50bb538e07e073c7128cd54ba179d814bd61c3009cf52ef25df433994"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.16.0/krtek-v0.16.0-linux-arm64.tar.gz"
      sha256 "57516c2d4d1758a2cf1a7b4ad04109389ae264ab7c6ecf8a26bc4f6aa0fbc543"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.16.0/krtek-v0.16.0-linux-x86_64.tar.gz"
      sha256 "15386306dc48f83bf2dfa0106055b1fd526803c6d6394e896829d2501497ef70"
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
