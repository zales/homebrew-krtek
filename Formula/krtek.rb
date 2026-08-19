# krtek 0.8.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ and SFTP"
  homepage "https://github.com/zales/krtek"
  version "0.8.0"
  license "MIT"

  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.8.0/krtek-v0.8.0-macos-arm64.tar.gz"
      sha256 "62bbfbee79405ee755ebd32de2ff232caf12d08ef0478317a03a30f17a707f42"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.8.0/krtek-v0.8.0-macos-x86_64.tar.gz"
      sha256 "da36c705c75551a76102a590a240963c134d5ed07120cecc0dc41d240ec58905"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.8.0/krtek-v0.8.0-linux-arm64.tar.gz"
      sha256 "4e6257dfb53c534d154110a9772b6cbe9f649a0c113bc09d85079e51db29d3af"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.8.0/krtek-v0.8.0-linux-x86_64.tar.gz"
      sha256 "d0ba3afb8366862b976615db8bff49f452586498928634ffea691fb6371a4abc"
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
