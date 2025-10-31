cask "forest" do
  version "0.4.5"
  sha256 "f7d6cb845b93b93ac703f3f63d7b6f4b2b07259e4298e82d24a5d53161e011d6"

  url "https://github.com/bwl/forest/releases/download/v#{version}/Forest_#{version}_aarch64.dmg"
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
