class Karl < Formula
  desc "Fast, one-shot LLM queries for your terminal"
  homepage "https://github.com/bwl/karl"
  version "0.1.0"
  license "MIT"

  on_macos do
    url "https://github.com/bwl/karl/releases/download/v#{version}/karl-darwin-arm64"
    sha256 "b9d81e5e275c7d79b041dd008a647d236b18876f03ebcd83c96803422eef4bf6"

    def install
      bin.install "karl-darwin-arm64" => "karl"
    end
  end

  on_linux do
    url "https://github.com/bwl/karl/releases/download/v#{version}/karl-linux-x64"
    sha256 "ff484ff2f49ae958ba8d2d467cb243cffe005088287ce5eb86a24caf463969c9"

    def install
      bin.install "karl-linux-x64" => "karl"
    end
  end

  test do
    assert_match "karl", shell_output("#{bin}/karl --help")
  end
end
