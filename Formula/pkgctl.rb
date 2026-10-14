class Pkgctl < Formula
    desc "Package manager updater"
    homepage "https://github.com/pkgctl/pkgctl"
    license "MIT"

    url "https://github.com/pkgctl/pkgctl/archive/refs/tags/v0.3.0.tar.gz"
    sha256 "ac8b6eeb222d50539039729420861a5f8243e83925034e20a1f6231c0aa84570"

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
