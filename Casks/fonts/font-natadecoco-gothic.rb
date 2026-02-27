cask "font-natadecoco-gothic" do
  version :latest
  sha256 :no_check

  url "https://kashika-lab.co.jp/wp-content/uploads/2025/08/Natadecoco-gothic_f.zip"
  name "Natadecoco gothic"
  desc "柔らかな幾何学図形が固まって生まれた優しい欧文フリーフォント"
  homepage "https://kashika-lab.co.jp/natadecoco-gothic"

  livecheck do
    skip
  end

  font "Natadecoco-gothic_f/Natadecoco-gothic.otf"
end
