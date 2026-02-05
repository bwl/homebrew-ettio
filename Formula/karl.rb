class Karl < Formula
  desc "Fast, one-shot LLM queries for your terminal"
  homepage "https://github.com/bwl/karl"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/bwl/karl/releases/download/v#{version}/karl-darwin-arm64"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

    def install
      bin.install "karl-darwin-arm64" => "karl"
    end
  end

  on_linux do
    url "https://github.com/bwl/karl/releases/download/v#{version}/karl-linux-x64"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"

    def install
      bin.install "karl-linux-x64" => "karl"
    end
  end

  test do
    assert_match "karl", shell_output("#{bin}/karl --help")
  end
end
