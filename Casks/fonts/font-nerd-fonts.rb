cask "font-nerd-fonts" do
  version "3.5.0"
  sha256 "49362450cd61b32c7d1dadbb98e82696d77cc215344636d25eabc8a82d6f8d7f"

  url "https://github.com/ryanoasis/nerd-fonts/releases/download/v#{version}/NerdFontsSymbolsOnly.zip",
      verified: "github.com/"
  name "Nerd Fonts"
  desc "Iconic font aggregator, collection, and patcher"
  homepage "https://nerdfonts.com/"

  font "SymbolsNerdFont-Regular.ttf"
end
