cask "forest" do
  version "0.4.0"
  sha256 "38dbfe9cc6f21d63b33705e50b9607725c874865eb47b825ba21170e8f6d840c"

  url "https://github.com/bwl/forest/releases/download/v#{version}/Forest.Desktop_0.1.0_aarch64.dmg"
  name "Forest Desktop"
  desc "Graph-native knowledge base with automatic semantic linking"
  homepage "https://github.com/bwl/forest"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Forest Desktop.app"

  binary "#{appdir}/Forest Desktop.app/Contents/MacOS/forest"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-rd", "com.apple.quarantine", "#{appdir}/Forest Desktop.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.forest.desktop",
    "~/Library/Caches/com.forest.desktop",
    "~/Library/Preferences/com.forest.desktop.plist",
    "~/Library/Saved Application State/com.forest.desktop.savedState",
  ]

  caveats <<~EOS
    Forest CLI is now available as 'forest' command!

    The binary has been linked to: #{HOMEBREW_PREFIX}/bin/forest

    Alternatively, you can add the app bundle's CLI to your PATH:
      echo 'export PATH="$PATH:#{appdir}/Forest Desktop.app/Contents/MacOS"' >> ~/.zshrc

    Or use the GUI installer: Press ⌘K, type /cli-install
  EOS
end
