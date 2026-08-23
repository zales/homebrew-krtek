# krtek 0.9.3. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ, SFTP and Kubernetes"
  homepage "https://github.com/zales/krtek"
  version "0.9.3"
  license "MIT"

  # Poured rather than "built", which is what stops Homebrew asking a
  # machine that compiles nothing whether its Xcode is new enough.
  bottle do
    root_url "https://github.com/zales/krtek/releases/download/v0.9.3"
    sha256 cellar: "/opt/homebrew/Cellar", arm64_sequoia: "6b95f0ff16df9b7a69eb27975fe8bfd53df0c0739d0c624f8f38dc1843bf19ae"
    sha256 cellar: :any, sequoia: "996641479f197c178f5682f396eb0642421e8b9e4887f705cffa5574094cea02"
  end
  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.3/krtek-v0.9.3-macos-arm64.tar.gz"
      sha256 "7f4fb2a95a37f2fc5ce342f946e09f9423ca574ccdd7a7d798eb832c52a8089c"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.3/krtek-v0.9.3-macos-x86_64.tar.gz"
      sha256 "2c24cfe05766d762765f62334a16116b2ba6770a72f49a5cddb35658517a6f98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.9.3/krtek-v0.9.3-linux-arm64.tar.gz"
      sha256 "ffd3d9fec0b626ee3c33dbefdca5dcc3da0e769098ec69017410e0732151aa2d"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.9.3/krtek-v0.9.3-linux-x86_64.tar.gz"
      sha256 "55dac44b822a2fa65bc7513c846876739d6c76c7bd58c2bfee8fad4587b5185d"
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
