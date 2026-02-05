class Karl < Formula
  desc "Fast, one-shot LLM queries for your terminal"
  homepage "https://github.com/bwl/karl"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/bwl/karl/releases/download/v#{version}/karl-darwin-arm64"
      sha256 "PLACEHOLDER_ARM64"

      def install
        bin.install "karl-darwin-arm64" => "karl"
      end
    end

    on_intel do
      url "https://github.com/bwl/karl/releases/download/v#{version}/karl-darwin-x64"
      sha256 "PLACEHOLDER_X64"

      def install
        bin.install "karl-darwin-x64" => "karl"
      end
    end
  end

  on_linux do
    url "https://github.com/bwl/karl/releases/download/v#{version}/karl-linux-x64"
    sha256 "PLACEHOLDER_LINUX"

    def install
      bin.install "karl-linux-x64" => "karl"
    end
  end

  test do
    assert_match "karl", shell_output("#{bin}/karl --help")
  end
end
