class Mksei < Formula
  desc "Small tool to automatically export and import custom macOS keyboard shortcuts"
  homepage "https://gist.github.com/5ouma/0a5717868f21a29ab96c914ddd55a409"
  url "https://gist.githubusercontent.com/5ouma/0a5717868f21a29ab96c914ddd55a409/raw/17d5f4dd78b62a4de619854af486c9e4e5b6b6c1/macos_keyboard_shortcuts_exporter_importer.php"
  version "1.2.1"
  sha256 "5880aa952d4912c689a0129eb80c1a36e2f1408c528d90db6e20d62f9510003a"
  head "https://gist.github.com/0a5717868f21a29ab96c914ddd55a409.git"

  depends_on :macos
  depends_on "php"

  def install
    bin.install "macos_keyboard_shortcuts_exporter_importer.php" => "mksei"
  end
end
