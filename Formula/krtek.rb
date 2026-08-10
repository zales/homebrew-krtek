# krtek 0.4.0. Written by packaging/formula.sh - do not edit by hand.
class Krtek < Formula
  desc "Database manager for the terminal: SQLite, PostgreSQL, MySQL/MariaDB, Redis"
  homepage "https://github.com/zales/krtek"
  version "0.4.0"
  license "MIT"

  # One static binary per platform: nothing is compiled and nothing is depended
  # on, because the client libraries are already inside it.
  on_macos do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.4.0/krtek-v0.4.0-macos-arm64.tar.gz"
      sha256 "8ac4c1c4bf34f6b553334f66f859a23b822bcbd00efb6267c3f4c20f03f2f067"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.4.0/krtek-v0.4.0-macos-x86_64.tar.gz"
      sha256 "787795f7ece3a4b457ae116ca6b662b4acc0d5ce0e9caca7c0e92a747537131f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/zales/krtek/releases/download/v0.4.0/krtek-v0.4.0-linux-arm64.tar.gz"
      sha256 "7245d9a05b3153c16c8c5c5a41dd93524fc65d51e5c926a646f7bdf58f7bef65"
    end
    on_intel do
      url "https://github.com/zales/krtek/releases/download/v0.4.0/krtek-v0.4.0-linux-x86_64.tar.gz"
      sha256 "569082760b8821149b4911b3e62aeada4d092bbad22d1d28feceda60eed621ca"
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
