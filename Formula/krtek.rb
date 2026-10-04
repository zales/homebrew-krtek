# krtek 0.13.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.13.0"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.13.0"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "da96a42da1dcbd18e6c3fd4520a41a54efd3a28aee2c813b15b1a6d91213d028"
    sha256 cellar: :any, sequoia: "639b6d7741ec62e35ef3a4d9c6bce428dacda63948013443f4c21c6b56dc9ee6"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.13.0/krtek-v0.13.0-macos-arm64.tar.gz"
      sha256 "b0c021735e6d6849f460ba5636f9aa4c83bc279fbd72b210d50d107a2486ec05"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.13.0/krtek-v0.13.0-macos-x86_64.tar.gz"
      sha256 "0824c8e3c0b5c9bd0dff5823fc59c95b63f229e213bf4249682579a3afe4ec0e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.13.0/krtek-v0.13.0-linux-arm64.tar.gz"
      sha256 "1d6438f7e74af00670d201f974abeb3ec04c821960679c764977f318abf4386d"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.13.0/krtek-v0.13.0-linux-x86_64.tar.gz"
      sha256 "55a7f6ecd8ffe1ba303bb331c2e6aaa4b0504acce2e3361f2de7c2afe8a612c8"
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
