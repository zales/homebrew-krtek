# krtek 0.7.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ and SFTP"
  homepage "https://github.com/zales/krtek"
  version "0.7.0"
  license "MIT"

  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.7.0/krtek-v0.7.0-macos-arm64.tar.gz"
      sha256 "05c7a1dcee60c44ebfe4e900d73f867ee604d9f4e031c048992bc7f523245500"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.7.0/krtek-v0.7.0-macos-x86_64.tar.gz"
      sha256 "af58a865ca6ecb64f3e228a7785cf3e830060bae35ab460c4e690945bdf943ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.7.0/krtek-v0.7.0-linux-arm64.tar.gz"
      sha256 "4c809bb2f0baedd5750951dd72ee12202a7b5da4ffbef5b57b1816736b0fa6cb"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.7.0/krtek-v0.7.0-linux-x86_64.tar.gz"
      sha256 "cc4da6b2ff9a64fa0f4779e72c3593a34ac739f622cde470b846459d91e41b1a"
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
