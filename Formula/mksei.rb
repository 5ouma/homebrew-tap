class Mksei < Formula
  desc "Small tool to automatically export and import custom macOS keyboard shortcuts"
  homepage "https://gist.github.com/5ouma/0a5717868f21a29ab96c914ddd55a409"
  url "https://gist.githubusercontent.com/5ouma/0a5717868f21a29ab96c914ddd55a409/raw/559ddf2ba41987102128527d53d8b075b8064238/macos_keyboard_shortcuts_exporter_importer.php"
  version "1.2.3"
  sha256 "ade83d9e7c68ac9dc15fa332231ec02bf6928ecc7f51be33df71415aa337f6ef"
  head "https://gist.github.com/0a5717868f21a29ab96c914ddd55a409.git"

  depends_on :macos
  depends_on "php"

  def install
    bin.install "macos_keyboard_shortcuts_exporter_importer.php" => "mksei"
  end
end
