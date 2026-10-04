# krtek 0.14.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.14.0"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.14.0"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "a2f84539c1a66f63f4f3e6fdd54a949635ea58e4d68d05ba0c90eaf22e56e9e3"
    sha256 cellar: :any, sequoia: "4b58bb7e1944df7a9e32eac5777bc8ae7e2ef6e509b1854c4befefc3722a2b7e"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.14.0/krtek-v0.14.0-macos-arm64.tar.gz"
      sha256 "50e83907ae68b2f9067d2271a03a5f53518ed361a3cd1ce9515b9268bcf546c8"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.14.0/krtek-v0.14.0-macos-x86_64.tar.gz"
      sha256 "f9c661eaa81967b2f3ac4402c83fc5e98ddcbf0044029dc7ee11624ea02f40a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.14.0/krtek-v0.14.0-linux-arm64.tar.gz"
      sha256 "e336ca2604bb1c8656e1d659a7ffa96d4be82085f1ace4bc5662cca0e6331e77"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.14.0/krtek-v0.14.0-linux-x86_64.tar.gz"
      sha256 "9f40860138297352484ef99bbed5feb43c46ccccc5e72a3024cf7e4770a1bf80"
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
