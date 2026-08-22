# krtek 0.9.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.9.0"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.9.0"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "4078c6ca7c97aba7abbf494e8643c4ac9ebade9f53c90ba67cfea545de6c0ccc"
    sha256 cellar: :any, sequoia: "2e7632b9e733d976328dffcfddf4d4a1956cc4b0554abe1ff22acdb5266c1103"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-macos-arm64.tar.gz"
      sha256 "3ae87a87299168f04ee88631e1df31264577d5549cc08df8ce6c378f3855c7ff"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-macos-x86_64.tar.gz"
      sha256 "a450ab8400acc6338ce49f250859a6a523746ea03a8a6733506113a6ea0fd272"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-linux-arm64.tar.gz"
      sha256 "e502ab953f04e792bd67305c08c806a4a16f342d5f77a1dd5b59cb56d6db2d38"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-linux-x86_64.tar.gz"
      sha256 "03fa569629315b9477ee32626162538e60ba6481eca3ad6065530ead059cf9df"
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
