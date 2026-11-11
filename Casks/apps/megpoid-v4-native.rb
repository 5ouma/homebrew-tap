cask "megpoid-v4-native" do
  version :latest
  sha256 :no_check

  url "https://download.ssw.co.jp/DL_Products/VL4_Megpoid/Mac/V4Megpoid_Native_Mac.dmg"
  name "VOCALOID4 Megpoid Native"
  desc "さらなる表現力を携えたあらゆるジャンルを歌いあげるバーチャルボーカリスト"
  homepage "https://ssw.co.jp/products/vocaloid4/megpoid/index.html"

  livecheck do
    skip
  end

  depends_on :macos

  pkg "VOCALOID4_Library_Megpoid_V4_Native_Installer.pkg"

  postflight_steps do
    run "{{appdir}}/VOCALOID/Uninstaller/VOCALOID License Manager Uninstaller.app/Contents/MacOS/Uninstall",
        sudo: true
    run "/bin/rm",
        args: ["-f", "-r", "{{appdir}}/VOCALOID/Uninstaller/VOCALOID License Manager Uninstaller.app"],
        sudo: true
  end

  uninstall_postflight_steps do
    run "/bin/rm",
        args: [
          "-f", "-r",
          "{{appdir}}/VOCALOID/Uninstaller/VOCALOID4/Megpoid_V4_Native Uninstaller.app",
          "{{appdir}}/VOCALOID/Uninstaller/VOCALOID4/Megpoid_V4_NativeFat Uninstaller.app"
        ],
        sudo: true
  end

  uninstall(
    script:  {
      executable: "/bin/bash",
      args:       [
        "-c",
        <<~EOS,
          '#{appdir}/VOCALOID/Uninstaller/VOCALOID4/Megpoid_V4_Native Uninstaller.app/Contents/MacOS/Uninstall'
          '#{appdir}/VOCALOID/Uninstaller/VOCALOID4/Megpoid_V4_NativeFat Uninstaller.app/Contents/MacOS/Uninstall'
        EOS
      ],
      sudo:       true,
    },
    pkgutil: [
      "com.yamaha.VOCALOID4.Megpoid_V4_Native",
      "com.yamaha.VOCALOID4.Megpoid_V4_NativeFat",
    ],
  )

  caveats "Don't forget to deactivate your license before uninstalling."
end
