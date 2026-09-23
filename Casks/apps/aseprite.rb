cask "aseprite" do
  version "1.3.18.6"
  sha256 "fa9dd07a0c2a5ec91a4166333296bbb9e5c237933b59875d0cfee849d2358306"

  url "https://github.com/aseprite/aseprite/releases/download/v#{version}/Aseprite-v#{version}-Source.zip"
  name "Aseprite"
  desc "Animated sprite editor and pixel art tool"
  homepage "https://www.aseprite.org/"

  livecheck do
    url "https://www.aseprite.org/trial"
    regex(/Aseprite Trial v(\d+\.\d+\.\d+(\.\d+)?) for macOS/)
  end

  auto_updates false
  depends_on formula: "cmake"
  depends_on formula: "ninja"
  depends_on :macos

  app "Aseprite.app"
  generated_script "build-aseprite",
                   content: File.read("#{__dir__}/../../scripts/build-aseprite")
  installer script: {
    executable: "build-aseprite",
    args:       [version],
  }

  uninstall trash: "#{appdir}/Aseprite.app"

  zap trash: [
    "~/Library/Application Support/Aseprite",
    "~/Library/Logs/Homebrew/aseprite",
    "~/Library/Preferences/Aseprite.plist",
    "~/Library/Preferences/org.aseprite.Aseprite.plist",
    "~/Library/Saved Application State/org.aseprite.Aseprite.savedState",
  ]
end
