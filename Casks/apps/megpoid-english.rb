cask "megpoid-english" do
  version :latest
  sha256 :no_check

  url "https://www2.ssw.co.jp/qsheet/DownLoadFile.aspx?d=1261"
  name "VOCALOID3 Megpoid English"
  desc "クリアな発音で英語の歌をうたう本格派女性ボーカリスト"
  homepage "https://ssw.co.jp/products/vocal3/mpe/index.html"

  livecheck do
    skip
  end

  depends_on :macos

  pkg "VOCALOID3 Library Megpoid English Installer.pkg"

  postflight_steps do
    run "{{appdir}}/VOCALOID/Uninstaller/VOCALOID License Manager Uninstaller.app/Contents/MacOS/Uninstall",
        sudo: true
    run "/bin/rm",
        args: ["-f", "-r", "{{appdir}}/VOCALOID/Uninstaller/VOCALOID License Manager Uninstaller.app"],
        sudo: true
  end

  uninstall_postflight_steps do
    run "/bin/rm",
        args: ["-f", "-r", "{{appdir}}/VOCALOID/Uninstaller/Megpoid English Uninstaller.app"],
        sudo: true
  end

  uninstall(
    script:  {
      executable: "/bin/bash",
      args:       [
        "-c",
        <<~EOS,
          '#{appdir}/VOCALOID/Uninstaller/Megpoid English Uninstaller.app/Contents/MacOS/Uninstall'
        EOS
      ],
      sudo:       true,
    },
    pkgutil: "com.yamaha.VOCALOID3.Megpoid_English",
  )

  caveats "Don't forget to deactivate your license before uninstalling."
end
