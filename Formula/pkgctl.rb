class Pkgctl < Formula
    desc "Package manager updater "
    homepage "https://github.com/pkgctl/pkgtl"
    license "MIT"

    url "https://github.com/pkgctl/pkgctl/archive/3b40dd4fbff270d9128988e73c562eff82a703a5.tar.gz"
    sha256 "296630f30a353ec05dc16e1419fe6480e575d24fdd3aa1464dcc72d808db717e"

    depends_on "go" => :build

    def install
        system "go build -o #{bin}/pkgctl"
    end

    test do
      system "#{bin}/pkgctl", "--version"
    end
end
