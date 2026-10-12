class Pkgctl < Formula
    desc "Package manager updater"
    homepage "https://github.com/pkgctl/pkgctl"
    license "MIT"

    url "https://github.com/pkgctl/pkgctl/archive/refs/tags/v0.2.0.tar.gz"
    sha256 "b4c8a78071347b957abb89dd82511909a030875b3224c42929dc5a6f4290d810"

    depends_on "go" => :build

    def install
        system "go build -o #{bin}/pkgctl"
    end

    service do
        run [opt_bin/"pkgctl", "check", "--if-due"]
        run_type :interval
        interval 900
        environment_variables PATH: std_service_path_env
        error_log_path var/"log/pkgctl.log"
    end

    test do
      system "#{bin}/pkgctl", "--version"
    end
end
