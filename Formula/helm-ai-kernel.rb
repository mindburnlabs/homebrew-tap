# frozen_string_literal: true

class HelmAiKernel < Formula
  desc "Fail-closed execution firewall for AI agents"
  homepage "https://github.com/Mindburn-Labs/helm-ai-kernel"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.0/helm-ai-kernel-darwin-arm64"
      sha256 "fc9a948ba63a6eec63f29658835fcd14630433639f3dfc60e9fd742abf367523"
    else
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.0/helm-ai-kernel-darwin-amd64"
      sha256 "d796eb395bddb71d949ed19bd86966d2202733341ce2818515ced2c7800686ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.0/helm-ai-kernel-linux-arm64"
      sha256 "f4683f8754e9228e5d6c286e4caed4acd716dc0ea738781c5d5edbd07b69d4ae"
    else
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.0/helm-ai-kernel-linux-amd64"
      sha256 "c642a2b693f4b919668e1f90f6475c94c7818c13dfea36397255d34b535c8c0c"
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
