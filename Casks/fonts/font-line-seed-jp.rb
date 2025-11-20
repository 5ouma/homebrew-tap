cask "font-line-seed-jp" do
  version "20251119"
  sha256 "97019208d3b6886d5fc584bf5285e09332271247786dd9f9b8d96964812a6290"

  url "https://github.com/line/seed/releases/download/v#{version}/seed-v#{version}.zip",
      verified: "github.com/"
  name "LINE Seed JP"
  desc "Seed, a word containing the meaning of growth, is LINE's first custom typeface"
  homepage "https://seed.line.me/"

  font "seed-v#{version}/LINESeedJP/fonts/otf/LINESeedJP-Bold.otf"
  font "seed-v#{version}/LINESeedJP/fonts/otf/LINESeedJP-ExtraBold.otf"
  font "seed-v#{version}/LINESeedJP/fonts/otf/LINESeedJP-Regular.otf"
  font "seed-v#{version}/LINESeedJP/fonts/otf/LINESeedJP-Thin.otf"
end
