class Dorg < Formula
  desc "Organize macOS Dock Items"
  homepage "https://github.com/5ouma/dorg"
  url "https://github.com/5ouma/dorg/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "e42e04621f6026d11174c07a7156f4582aaf4f3bad78b33723353f79ef76e8ce"
  license "MIT"
  head "https://github.com/5ouma/dorg.git", branch: "main"

  depends_on "go" => :build
  depends_on :macos

  def install
    system "go", "build", *std_go_args
    generate_completions_from_executable("#{bin}/#{name}", "completion")
  end

  test do
    home = testpath/"home"
    ENV["HOME"] = home.to_s
    mkdir_p home/"Library/Preferences"
    (home/"Library/Preferences/com.apple.dock.plist").write <<~PLIST
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>persistent-apps</key>
        <array/>
        <key>persistent-others</key>
        <array/>
      </dict>
      </plist>
    PLIST
    output = testpath/"dorg.yml"
    system "#{bin}/#{name}", "save", "--file", output
    assert_path_exists output
    assert_match "dock", output.read
  end
end
