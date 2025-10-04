cask "freefilesync" do
  version "14.5"
  sha256 "811ead8b4d141d92cab792b9c5e71daa3ce65de8abc814e95865e4fcf9a8e470"

  url "https://freefilesync.org/download/FreeFileSync_#{version}_macOS.zip"
  name "FreeFileSync"
  desc "Folder comparison and synchronization software"
  homepage "https://freefilesync.org/"

  livecheck do
    url "https://freefilesync.org/download.php"
    regex(/href=.*?FreeFileSync[._-]v?(\d+(?:\.\d+)+)(?:[._-]macOS)?\.zip/i)
  end

  auto_updates false

  pkg "FreeFileSync_#{version}.pkg",
      choices: [
        {
          "choiceIdentifier" => "installer_choice_1",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 1,
        },
        {
          "choiceIdentifier" => "installer_choice_2",
          "choiceAttribute"  => "selected",
          "attributeSetting" => 0,
        },
      ]

  uninstall pkgutil: [
              "org.freefilesync.pkg.FreeFileSync",
              "org.freefilesync.pkg.RealTimeSync",
            ],
            delete:  "/usr/local/bin/freefilesync"

  zap trash: [
    "~/Library/Application Support/FreeFileSync",
    "~/Library/Preferences/org.freefilesync.FreeFileSync.plist",
  ]

  caveats do
    files_in_usr_local
  end
end
