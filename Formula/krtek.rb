# krtek 0.13.1. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.13.1"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.13.1"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "642be6751a0edc21000e0fbc04414b19bc7509e9b43364f616b7a6ad60505e19"
    sha256 cellar: :any, sequoia: "4924f21b42fa93db36a8172b6ed3f52a77ac58c192695698590d0f722f56224d"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.13.1/krtek-v0.13.1-macos-arm64.tar.gz"
      sha256 "c0c4877f5c0548ba161a1ed6eddb6a3042a5e26d8d64717c579658a636c8f6a7"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.13.1/krtek-v0.13.1-macos-x86_64.tar.gz"
      sha256 "8b0005cccb792971e261894f5065439794bd257fe730b669a7dcf66a6f8c82cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.13.1/krtek-v0.13.1-linux-arm64.tar.gz"
      sha256 "05d5b9677dd8227867e4c29743bec10f47b268c09cd458490548e61bdd24f524"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.13.1/krtek-v0.13.1-linux-x86_64.tar.gz"
      sha256 "125d46db501f29f942800993eb5ff9568221b4a1194fd9ddb97809d04b31962e"
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
