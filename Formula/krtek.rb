# krtek 0.6.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3 and RabbitMQ"
  homepage "https://github.com/zales/krtek"
  version "0.6.0"
  license "MIT"

  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.6.0/krtek-v0.6.0-macos-arm64.tar.gz"
      sha256 "29899196ad0d11b918ba22a6bf6d8916ccf2f44952d2e74cdd051b4cf1493272"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.6.0/krtek-v0.6.0-macos-x86_64.tar.gz"
      sha256 "e0bfc0f575acdb0d9de3870f870f23b4be89a67ff2492e9894167cd336bb7c4a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.6.0/krtek-v0.6.0-linux-arm64.tar.gz"
      sha256 "f732038b44475b48b34eb69eea6fe14046ee0416431dc791c53d19a0cedc7f49"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.6.0/krtek-v0.6.0-linux-x86_64.tar.gz"
      sha256 "d8c0dbc1aebbeba5ff39a810e06ba017dd257d709ec0c64a44942893e72f98e5"
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
