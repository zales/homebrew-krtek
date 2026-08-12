# krtek 0.7.2. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Terminal database manager for SQLite, PostgreSQL, MySQL, Redis, Kafka, S3, Azure Blob, RabbitMQ and SFTP"
  homepage "https://github.com/zales/krtek"
  version "0.7.2"
  license "MIT"

  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.7.2/krtek-v0.7.2-macos-arm64.tar.gz"
      sha256 "fd2de3d18b0efa9b075ccdc0ffea6aac1243952a26969c2c3c4e7ddeb5307e47"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.7.2/krtek-v0.7.2-macos-x86_64.tar.gz"
      sha256 "dc72d7c3df0b5ffb88ac63cb2f545530fd3e27de8a95f59cf75a2e735426cd08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.7.2/krtek-v0.7.2-linux-arm64.tar.gz"
      sha256 "7f23cbf340b63d3653ac73bfa89fe60759a778b5502f249da84374a85a8dbdb4"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.7.2/krtek-v0.7.2-linux-x86_64.tar.gz"
      sha256 "816a8b829f232a3a7dbdb00b580fb94b344e12289d5d0bf3f936f3f99f1d6e29"
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
