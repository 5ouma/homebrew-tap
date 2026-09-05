cask "font-ndot" do
  version :latest
  sha256 :no_check

  url "https://cdn.shopify.com/oxygen-v2/43495/38485/80939/1952643/fonts/Ndot-55.otf"
  name "Ndot"
  desc "Nothing original pixel font in Nothing OS"
  homepage "https://nothing.tech/"

  livecheck do
    skip
  end

  font "Ndot-55.otf"
end
