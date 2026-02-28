class K8sCfBackup < Formula
  desc "Backup and restore Kubernetes PersistentVolume host paths to Cloudflare R2"
  homepage "https://github.com/bitia-org/k8s-hostpath-cloudflare-backup"
  version "0.0.1-6"

  bottle do
    root_url "https://github.com/bitia-org/k8s-hostpath-cloudflare-backup/releases/download/v0.0.1-6"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "02fab4d00a3abb9bb91e54a2a66b8c10dd8064a55b9c844bf746551ce62fc718"
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bitia-org/k8s-hostpath-cloudflare-backup/releases/download/v0.0.1-6/k8s-cf-backup-linux-amd64.tar.gz"
      sha256 "c05446274af8f37906b2c77ef9114208bd496b9f95be4a0937868bcf9a7c658f"

      def install
        bin.install "k8s-cf-backup"
      end
    end
  end

  test do
    assert_match "Backup and restore Kubernetes", shell_output("#{bin}/k8s-cf-backup --help 2>&1")
  end
end
