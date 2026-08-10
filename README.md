# homebrew-krtek

The Homebrew tap for [krtek](https://github.com/zales/krtek) - a database manager
for the terminal, with SQLite, PostgreSQL, MySQL/MariaDB and Redis behind one
interface.

```sh
brew install zales/krtek/krtek
```

macOS and Linux, both architectures. Nothing is compiled: the formula installs the
binary from the release, and that binary needs nothing installed either - the
client libraries are linked into it.

`Formula/krtek.rb` is written by
[packaging/formula.sh](https://github.com/zales/krtek/blob/main/packaging/formula.sh)
from the checksums the release archives were packaged with, so it is not edited by
hand.
