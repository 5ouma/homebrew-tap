cask "font-donguri-duel" do
  version :latest
  sha256 :no_check

  url "https://hicchicc.github.io/00ff/x10y12pxDonguriDuel.ttf"
  name "どんぐりデュエル"
  desc "ふとじころころピクセルフォント"
  homepage "https://hicchicc.github.io/00ff"

  livecheck do
    skip
  end

  font "x10y12pxDonguriDuel.ttf"
end
