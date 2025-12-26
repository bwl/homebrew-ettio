class Tx < Formula
  desc "Simple speech-to-text CLI - start talking, hit Enter, get text"
  homepage "https://github.com/bwl/tx"
  url "https://github.com/bwl/tx.git", tag: "v0.1.0"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/bwl/tx.git", branch: "master"

  depends_on "rust" => :build
  depends_on "cmake" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      tx requires a Whisper model file. Download the base English model:

        mkdir -p ~/.local/share/tx/models
        curl -L https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.en.bin \\
          -o ~/.local/share/tx/models/ggml-base.en.bin

      Or set TX_MODEL_PATH to point to your model file.
    EOS
  end

  test do
    assert_match "speech-to-text", shell_output("#{bin}/tx --help")
  end
end
