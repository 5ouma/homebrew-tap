cask "jiba" do
  version "1.1.2"
  sha256 "3cf3beecd3131dc1ad4d6df96cc83adc15b1a339d1940959bca583edf02b05ab"

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
