cask "jiba" do
  version "1.2.2"
  sha256 "c3b39207b6374a7ad79472959e1942a2ae667819f3a68283a5407c429f47f675"

  url "https://hee.ink/updates/stable/JiBA-#{version}.dmg"
  name "JiBA"
  desc "Japanese is Back Again"
  homepage "https://jiba.hee.ink/"

  livecheck do
    url "https://hee.ink/updates/stable/latest.json"
    strategy :json do |json|
      json["version"]
    end
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
