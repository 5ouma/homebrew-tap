cask "vocaloid7-editor" do
  version :latest
  sha256 :no_check

  url "https://www.vocaloid.com/en/download_trials/vocaloid7_mac"
  name "VOCALOID7 Editor"
  desc "この歌声がオンガクを動かす"
  homepage "https://www.vocaloid.com/vocaloid7/"

  livecheck do
    skip
  end

  depends_on :macos

  pkg "VOCALOID7_Editor_Installer.pkg"

  uninstall(
    script:  {
      executable: "#{appdir}/VOCALOID7/Uninstaller/VOCALOID7 Editor Uninstaller.app/Contents/Commands/uninstall.sh",
      sudo:       true,
    },
    pkgutil: "com.yamaha.VOCALOID7.Editor",
  )
end
