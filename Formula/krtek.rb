# krtek 0.11.1. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.11.1"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.11.1"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "c7297586be945a761c27498b252a374d71c599e819fbf8691d87dd785b4ca69f"
    sha256 cellar: :any, sequoia: "28d6c518baa5af65272aa64a513d897a52fc2c9176b306e30b95ff4f7a0b3b62"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.11.1/krtek-v0.11.1-macos-arm64.tar.gz"
      sha256 "70a44dd5a06f4eca72382f6c6a0fcac43b5693321243763a3f53af6028d7a3c3"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.11.1/krtek-v0.11.1-macos-x86_64.tar.gz"
      sha256 "fc0cc9113b0f748a0dfa613573c9a470ccdc4a638ed9310eeb3f3a922d219d97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.11.1/krtek-v0.11.1-linux-arm64.tar.gz"
      sha256 "5fce4f9fb07333351e81f767411386339017d739b9381d5b7767c2ddb37bb6e5"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.11.1/krtek-v0.11.1-linux-x86_64.tar.gz"
      sha256 "685e5383814611e49e4255c07cb41818ff1df1ff6e5690dade8d12aae6fa8e60"
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
