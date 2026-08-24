# krtek 0.10.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.10.0"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.10.0"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "9ba8edbc4228482169ff172156f2d179247fa711684b0794abf09e5539c3b499"
    sha256 cellar: :any, sequoia: "4e921be1c2b2d34aef4770e9d5d6880b0a30b2e0b384c7cfa684cfc97b93e911"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.10.0/krtek-v0.10.0-macos-arm64.tar.gz"
      sha256 "2b83f3032a498ff5f1ebb5738d1e713d4cda7d553dde0e67f428b93961088747"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.10.0/krtek-v0.10.0-macos-x86_64.tar.gz"
      sha256 "265d2eb4f8a0df269f8cf7e7c0f2c267f8ce25a74c4261234431ffdcba7b38e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.10.0/krtek-v0.10.0-linux-arm64.tar.gz"
      sha256 "2be0ffe7be780e200f593f2f7efd2446de929ad0c9ebd828062a1898f7a588f9"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.10.0/krtek-v0.10.0-linux-x86_64.tar.gz"
      sha256 "ee8e5043b3bf2bc204702eb28b65024292a40a395ba6d13696588d586d7a270c"
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
