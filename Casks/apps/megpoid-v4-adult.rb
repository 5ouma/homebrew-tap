cask "megpoid-v4-adult" do
  version :latest
  sha256 :no_check

  url "https://download.ssw.co.jp/DL_Products/VL4_Megpoid/Mac/V4Megpoid_Adult_Mac.dmg"
  name "VOCALOID4 Megpoid Adult"
  desc "さらなる表現力を携えたあらゆるジャンルを歌いあげるバーチャルボーカリスト"
  homepage "https://ssw.co.jp/products/vocaloid4/megpoid/index.html"

  livecheck do
    skip
  end

  depends_on :macos

  pkg "VOCALOID4_Library_Megpoid_V4_Adult_Installer.pkg"

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
          "{{appdir}}/VOCALOID/Uninstaller/VOCALOID4/Megpoid_V4_Adult Uninstaller.app",
          "{{appdir}}/VOCALOID/Uninstaller/VOCALOID4/Megpoid_V4_MellowAdult Uninstaller.app"
        ],
        sudo: true
  end

  uninstall(
    script:  {
      executable: "/bin/bash",
      args:       [
        "-c",
        <<~EOS,
          '#{appdir}/VOCALOID/Uninstaller/VOCALOID4/Megpoid_V4_Adult Uninstaller.app/Contents/MacOS/Uninstall'
          '#{appdir}/VOCALOID/Uninstaller/VOCALOID4/Megpoid_V4_MellowAdult Uninstaller.app/Contents/MacOS/Uninstall'
        EOS
      ],
      sudo:       true,
    },
    pkgutil: [
      "com.yamaha.VOCALOID4.Megpoid_V4_Adult",
      "com.yamaha.VOCALOID4.Megpoid_V4_MellowAdult",
    ],
  )

  caveats "Don't forget to deactivate your license before uninstalling."
end
