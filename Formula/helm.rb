# frozen_string_literal: true

class Helm < Formula
  desc "Fail-closed execution firewall for AI agents"
  homepage "https://github.com/Mindburn-Labs/helm-oss"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Mindburn-Labs/helm-oss/releases/download/v0.5.0/helm-darwin-arm64"
      sha256 "1036b1c1b3ef0dfa36788cd1e9ff18524da3d6cb4221ffe1a726402953a22da4"
    else
      url "https://github.com/Mindburn-Labs/helm-oss/releases/download/v0.5.0/helm-darwin-amd64"
      sha256 "1b4787ca36011455395c71b012963a55deef21790d8ed59fa68381807c46ee8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Mindburn-Labs/helm-oss/releases/download/v0.5.0/helm-linux-arm64"
      sha256 "c073f8b95e12f524d39a59648ba6a4097d1225ea83305ad8e405a757d1d338aa"
    else
      url "https://github.com/Mindburn-Labs/helm-oss/releases/download/v0.5.0/helm-linux-amd64"
      sha256 "0877a48a905e33fab87a379201b051433108e09ce993d8e8bea51430e6bc920d"
    end
  end

  def install
    binary = Dir["helm-*"].first || "helm"
    bin.install binary => "helm"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/helm version 2>&1")
  end
end
