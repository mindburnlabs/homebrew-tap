# frozen_string_literal: true

class HelmAiKernel < Formula
  desc "Fail-closed execution firewall for AI agents"
  homepage "https://github.com/Mindburn-Labs/helm-ai-kernel"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.0/helm-ai-kernel-darwin-arm64"
      sha256 "a42b04e9d537608bb6fe2a19fc355b1e848ba84a11b3661508643c6eb487daa0"
    else
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.0/helm-ai-kernel-darwin-amd64"
      sha256 "36cdcc6fe43e2ee61bd5a602ea82c0880dcfc95c1f69564bdd4366ce997e39a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.0/helm-ai-kernel-linux-arm64"
      sha256 "ef7372f02c3ffcf90e6cec3fb5470cf718516f8ee04d34c170881232b7317a1c"
    else
      url "https://github.com/Mindburn-Labs/helm-ai-kernel/releases/download/v0.5.0/helm-ai-kernel-linux-amd64"
      sha256 "d0a5693b4fef90e3cd3bb1f84cabfc1bab4f9b94b266dcf59448e6bf83b912cc"
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
