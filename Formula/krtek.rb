# krtek 0.5.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Database manager for the terminal: SQLite, PostgreSQL, MySQL/MariaDB, Redis"
  homepage "https://github.com/zales/krtek"
  version "0.5.0"
  license "MIT"

  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.5.0/krtek-v0.5.0-macos-arm64.tar.gz"
      sha256 "1a369e423933d5f2d29537548bdc9b520b81d3f5b87b91783d09676a51d82a25"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.5.0/krtek-v0.5.0-macos-x86_64.tar.gz"
      sha256 "611308ea30c65bfd6cbe6c18167f47e262bf5bc0a2a5530bc25323bf7d0d601c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.5.0/krtek-v0.5.0-linux-arm64.tar.gz"
      sha256 "3171f3f962bc970923d146f2f4f404df25b4a0c7b7b7e90b2d3db3d8cb3f1bfa"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.5.0/krtek-v0.5.0-linux-x86_64.tar.gz"
      sha256 "41337d7cdcda6714d1e9770006e9b648860e85ecf87e4b3cbcbcc1469f587ccb"
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
