cask "copypath" do
  version "1.0.0"
  sha256 "817f024353a5b43df28cb1ceb85d2937ef594ec557361a412d66d7c686085a89"

  url "https://github.com/Engagendy/CopyPath/releases/download/v#{version}/CopyPath-#{version}.zip",
      verified: "github.com/Engagendy/CopyPath/"

  name "CopyPath"
  desc "Copy file and folder paths from the Finder right-click menu"
  homepage "https://github.com/Engagendy/CopyPath"

  depends_on macos: ">= :ventura"

  app "CopyPath.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/CopyPath.app"],
                   sudo: true
  end

  zap trash: [
    "~/Library/Caches/com.engagendy.copypath",
    "~/Library/Preferences/com.engagendy.copypath.plist",
    "~/Library/Saved Application State/com.engagendy.copypath.savedState",
  ]
end
