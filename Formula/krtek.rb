# krtek 0.4.1. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Database manager for the terminal: SQLite, PostgreSQL, MySQL/MariaDB, Redis"
  homepage "https://github.com/zales/krtek"
  version "0.4.1"
  license "MIT"

  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.4.1/krtek-v0.4.1-macos-arm64.tar.gz"
      sha256 "d76eab906fb08a2baf7e129c6a521e83afc9d07ea2dc7a0a132436c71e12b783"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.4.1/krtek-v0.4.1-macos-x86_64.tar.gz"
      sha256 "2e6b2afc0508c08be8a6075c96ae4e8bde1ea61523b6b29b2d665f4d1029c079"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.4.1/krtek-v0.4.1-linux-arm64.tar.gz"
      sha256 "9ffc82fdc06dbae7e7a6dd4cb88e650d3b3cf72c09bce4b91ce87a6fccd6bd5b"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.4.1/krtek-v0.4.1-linux-x86_64.tar.gz"
      sha256 "020711495954b98eda1d784790de99a05e637b08f2d92ce498b08169166e92ce"
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
