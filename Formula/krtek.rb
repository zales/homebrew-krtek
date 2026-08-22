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
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "d968a25a1df03c1b050d685b90866a0445ca8e9b41be4f89702b6fbf9acc9246"
    sha256 cellar: :any, sequoia: "1ba8fcdc8049733b8504861ebdfc36f243b2a1c49243ddb86e0233abae9146e3"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-macos-arm64.tar.gz"
      sha256 "9256b6a516f5e9f07f6a81322e116e2031bfbb8e38bda21ec7721d9f7be9420b"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-macos-x86_64.tar.gz"
      sha256 "a54dd1f970618c3101f1f563aea4d9f43395a214d52310d1ccf6316e6bdd36c7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-linux-arm64.tar.gz"
      sha256 "9a6ba2dd71b212c079c27dcccee4e3d9e74df2bea746800fbe0a434bd802efbd"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.0/krtek-v0.9.0-linux-x86_64.tar.gz"
      sha256 "22b2c75621eee59eb3733ac3b3ed0840d023aedb7fc3d1539ec88ae44f789ee1"
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
