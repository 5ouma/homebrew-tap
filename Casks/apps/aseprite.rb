cask "aseprite" do
  version "1.3.14.1"
  sha256 "0d29d7fd3dc491c242ebd8f42a9254078a9cd652a7ff47009dda57fbd344fd72"

  url "https://www.aseprite.org/downloads/trial/Aseprite-v#{version}-trial-macOS.dmg"
  name "Aseprite"
  desc "Animated Sprite Editor & Pixel Art Tool"
  homepage "https://www.aseprite.org/"

  livecheck do
    url "https://www.aseprite.org/trial"
    regex(/Aseprite Trial v(\d+\.\d+\.\d+(\.\d+)?) for macOS/)
  end

  auto_updates false

  app "Aseprite.app"

  zap trash: [
    "~/Library/Application Support/Aseprite",
    "~/Library/Logs/Homebrew/aseprite",
    "~/Library/Preferences/Aseprite.plist",
    "~/Library/Preferences/org.aseprite.Aseprite.plist",
    "~/Library/Saved Application State/org.aseprite.Aseprite.savedState",
  ]
end
