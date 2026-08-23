# krtek 0.9.4. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.9.4"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.9.4"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "c03e694313fdf2d301c8f61cb2c4ec30546e10ee9fcc84a4a24f1fa761e6e987"
    sha256 cellar: :any, sequoia: "689568a92731262d01582600c1243fefa9320fca80a39b273df1337b911b50cd"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.4/krtek-v0.9.4-macos-arm64.tar.gz"
      sha256 "952a74b53bca26984a007d9b4daba1e444800941699f1abff294c313af591a78"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.4/krtek-v0.9.4-macos-x86_64.tar.gz"
      sha256 "faba42f611d60418422b77c33883fe27e07aee07e2272fde606af755f88b754a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.4/krtek-v0.9.4-linux-arm64.tar.gz"
      sha256 "a9fc494818a8a9f944e4077750f68a2ced98d87ef1e2b1aaae60e616c315f682"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.4/krtek-v0.9.4-linux-x86_64.tar.gz"
      sha256 "cb79ae2b5f2c9fc4432a4565804d58500e373ba151196e827a692a3cd01c8229"
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
