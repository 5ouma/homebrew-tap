cask "jiba" do
  version "1.0.1"
  sha256 "3ece1eddb2a194556134c6683c863298591ff073f6109a597f6e6185b60aef0f"

  url "https://hee.ink/updates/stable/JiBA-#{version}.dmg"
  name "JiBA"
  desc "Japanese is Back Again"
  homepage "https://jiba.hee.ink/"

  livecheck do
    url "https://jiba.hee.ink"
    regex(/JiBA-(\d+\.\d+\.\d+)\.dmg/)
  end

  app "JiBA.app"

  zap trash: [
    "~/Library/Application Support/JiBA",
    "~/Library/Caches/ink.hee.jibapplemusic",
    "~/Library/HTTPStorages/ink.hee.jibapplemusic",
    "~/Library/Preferences/ink.hee.jibapplemusic.plist",
    "~/Library/Saved Application State/ink.hee.jibapplemusic.savedState",
  ]
end
