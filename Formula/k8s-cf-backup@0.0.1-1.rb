class K8sCfBackupAT0011 < Formula
  desc "Backup and restore Kubernetes PersistentVolume host paths to Cloudflare R2"
  homepage "https://github.com/bitia-org/k8s-hostpath-cloudflare-backup"
  version "0.0.1-1"

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/bitia-org/k8s-hostpath-cloudflare-backup/releases/download/v0.0.1-1/k8s-cf-backup-linux-amd64.tar.gz"
      sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

      def install
        bin.install "k8s-cf-backup"
      end
    end
  end

  test do
    assert_match "Kubernetes namespace", shell_output("#{bin}/k8s-cf-backup --help 2>&1")
  end
end
