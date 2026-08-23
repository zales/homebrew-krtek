# krtek 0.9.2. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.9.2"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.9.2"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "8c27729faaa2696dde3b57c037c6b3b780504054bb2bb3d39344f9a5fafe1d6e"
    sha256 cellar: :any, sequoia: "d92cb51d5e6684fa3246f9c216b2b1aa41a0a5ab44610143d05685c772ebf4a2"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.2/krtek-v0.9.2-macos-arm64.tar.gz"
      sha256 "0a88a578a9b5910a9d9b5388edaca1000454c792fa38fe3a3d832adbbcd73df8"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.2/krtek-v0.9.2-macos-x86_64.tar.gz"
      sha256 "8308bd933330df259240c2d5c58942034022062d3d89e085313474c4d4a8fa12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.2/krtek-v0.9.2-linux-arm64.tar.gz"
      sha256 "4e804cec8f939d074ff7f9f13a7df67414fba5c96a078f93789b3cf87b63e344"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.2/krtek-v0.9.2-linux-x86_64.tar.gz"
      sha256 "5611885c196084a9b06e13fcc0888f5abeae57002b52ed7d65267a954382f6fb"
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
