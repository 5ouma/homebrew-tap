cask "font-giro" do
  version :latest
  sha256 :no_check

  url "https://dl.dafont.com/dl/?f=giro"
  name "Giro Light"
  desc "Giro is an informal sans serif typeface"
  homepage "https://www.marcelomagalhaes.net/"

  livecheck do
    skip
  end

  font "girolight001.otf"
  font "girooutline001.otf"
end
