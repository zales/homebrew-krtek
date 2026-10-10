# krtek 0.17.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, MQTT, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.17.0"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.17.0"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "01955416728fe402e40911b3504414d82a7af91e3769ead1ff2360ac54a8e41e"
    sha256 cellar: :any, sequoia: "9b846df7a10c1776b7ba9b501d8c009bb5b44f417cebc8f14bde10506a7fd5d4"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.17.0/krtek-v0.17.0-macos-arm64.tar.gz"
      sha256 "f815464f3f826b1cb8838c72d992989f593ad4338cc16920fef4490d631f46c6"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.17.0/krtek-v0.17.0-macos-x86_64.tar.gz"
      sha256 "9cfc444f47f81830d17a661c3130ac6186ab6223171c06258d78fe5a10a8259f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.17.0/krtek-v0.17.0-linux-arm64.tar.gz"
      sha256 "43b456490bbdf500ba22280a8f6993287f8cf826224dcde0c628908a681af5c9"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.17.0/krtek-v0.17.0-linux-x86_64.tar.gz"
      sha256 "222b5384954cbce1811a6f2f943007bbe2ba856ffbe234609f79c26db5aa6f36"
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
