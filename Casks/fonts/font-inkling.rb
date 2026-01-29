cask "font-inkling" do
  version "2.0"
  sha256 "d41c95f5cfd6e59af1414fa1ecb0b0a3f986bf135376e4dfff1f3495a818a843"

  url "http://frozenpandaman.github.io/Inkling_v#{version.major}.otf"
  name "Inkling"
  desc "Font created from characters that appear in the game Splatoon"
  homepage "https://frozenpandaman.github.io/inkling.html"

  livecheck do
    url :homepage
    regex(/VERSION (\d+\.\d+)/)
  end

  font "Inkling_v2.otf"
end
