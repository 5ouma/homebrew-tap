cask "jiba" do
  version "1.3.1"
  sha256 "8ae0a076a0760b2696996cff5c6fd92a5b06d2518cf36681a497728eaf952094"

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
