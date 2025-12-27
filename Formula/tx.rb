class Tx < Formula
  desc "Simple speech-to-text CLI - start talking, hit Enter, get text"
  homepage "https://github.com/bwl/tx"
  url "https://github.com/bwl/tx.git", tag: "v0.3.0"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/bwl/tx.git", branch: "master"

  depends_on "rust" => :build
  depends_on "cmake" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      On first run, tx will prompt to download the Whisper model (~141MB).
      The model is stored in ~/.local/share/tx/models/

      Or set TX_MODEL_PATH to point to your own model file.
    EOS
  end

  test do
    assert_match "speech-to-text", shell_output("#{bin}/tx --help")
  end
end
