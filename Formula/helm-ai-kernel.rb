# frozen_string_literal: true

class HelmAiKernel < Formula
  desc "Fail-closed execution firewall for AI agents"
  homepage "https://github.com/Mindburn-Labs/helm-ai-kernel"
  version "0.5.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.4/helm-ai-kernel-darwin-arm64"
      sha256 "ba676a96389cd6edfb654c4e49d04e1b87425074a20b05b5a11ffecd98b2aec6"
    else
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.4/helm-ai-kernel-darwin-amd64"
      sha256 "091d39727c2973747f5de08ac7ff8e0a4fd3cd1019581d0bdf973981f1ecba7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.4/helm-ai-kernel-linux-arm64"
      sha256 "2e1b819ff48ac80ab8fc14304e0906890471c16b9ea2e02495386175e9fbb8cf"
    else
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.4/helm-ai-kernel-linux-amd64"
      sha256 "f48299368fd6599507389e517736b616abb1dea72500aff5810e8595dbe667c1"
    end
  end

  def install
    binary = Dir["helm-ai-kernel-*"].first || "helm-ai-kernel"
    bin.install binary => "helm-ai-kernel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/helm-ai-kernel version 2>&1")
  end
end
