cask "jiba" do
  version "1.1.1"
  sha256 "03e3ba79b79bdd75929989acef4d6e8a0113a202d0e941c62a02de0821d5af92"

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
