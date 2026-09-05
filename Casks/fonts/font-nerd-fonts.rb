cask "font-nerd-fonts" do
  version "3.5.1"
  sha256 "fdca3682534f6f65e1ccb2345b0362ccf67d9b8eca7c8025330946e93e2473bc"

  url "https://github.com/ryanoasis/nerd-fonts/releases/download/v#{version}/NerdFontsSymbolsOnly.zip"
  name "Nerd Fonts"
  desc "Iconic font aggregator, collection, and patcher"
  homepage "https://nerdfonts.com/"

  font "SymbolsNerdFont-Regular.ttf"
end
