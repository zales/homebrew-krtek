# krtek 0.9.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ and SFTP"
  homepage "https://github.com/zales/krtek"
  version "0.9.0"
  license "MIT"

  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-macos-arm64.tar.gz"
      sha256 "3aed60eea79bb095bb351cbd9489107c615d8f19b91daac6c795551c79bf4e2e"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-macos-x86_64.tar.gz"
      sha256 "e39d53413a7866667a50be8d87275e2b943cfebe966de6735a1d8b9fe490c253"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-linux-arm64.tar.gz"
      sha256 "75928997ad20b05d553b1ec9748ffbc5704b08991f77dbf2e95b8ca30a149087"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-linux-x86_64.tar.gz"
      sha256 "33cedef49b69b19990dedb93426c3ca6a6d86594cc7102dcfc01ebeab04f81ed"
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
