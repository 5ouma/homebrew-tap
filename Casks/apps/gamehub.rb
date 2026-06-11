cask "gamehub" do
  version :latest
  sha256 :no_check

  url "https://api-international-gamehub.xiaoji.com/game/download/mac/en",
      verified: "api-international-gamehub.xiaoji.com/"
  name "GameHub"
  desc "Ushering in a brand-new gaming experience"
  homepage "https://www.gamemac.com/"

  depends_on :macos

  app "GameHub.app"

  zap trash: [
    "~/Library/Application Scripts/com.gamemac.www.quicklook",
    "~/Library/Application Scripts/com.gamemac.www.thumbnail",
    "~/Library/Application Support/com.gamemac.www",
    "~/Library/Application Support/GameHub",
    "~/Library/Caches/com.gamemac.www",
    "~/Library/Containers/com.gamemac.www.quicklook",
    "~/Library/Containers/com.gamemac.www.thumbnail",
    "~/Library/HTTPStorages/com.gamemac.www.binarycookies",
    "~/Library/Logs/com.gamemac.www",
    "~/Library/Saved Application State/com.gamemac.www.savedState",
    "~/Library/WebKit/com.gamemac.www",
  ]
end
