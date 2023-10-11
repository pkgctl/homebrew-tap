class Pkgctl < Formula
    desc "Package manager updater "
    homepage "https://github.com/pkgctl/pkgtl"
    license "MIT"

    url "https://github.com/pkgctl/pkgctl/archive/b7f733e6d17d49dce151fec7dbf0e631c37ee686.tar.gz"
    sha256 "3a30efe36805c7c79f322f0ce58c1ec78d4fe438a02e4de4eb6aa7cc441e0dc4"

    depends_on "go" => :build

    def install
        system "go build -o #{bin}/pkgctl"
    end

    test do
      system "#{bin}/pkgctl", "--version"
    end
end
