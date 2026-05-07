cask "mclean" do
  version "1.0.5"
  sha256 "ad16e3d73de091b17bb831d6d7a5c5a50c644744323d33e245f21621f80662dc"

  url "https://github.com/Engagendy/mclean/releases/download/v1.0.5/MClean-#{version}-arm64.dmg",
      verified: "github.com/Engagendy/mclean/"

  name "MClean"
  desc "Native macOS cleanup scanner for cache, temporary, old, and large files"
  homepage "https://github.com/Engagendy/mclean"

  depends_on macos: ">= :sonoma"

  app "MClean.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MClean.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/com.engagendy.MClean",
    "~/Library/Preferences/com.engagendy.MClean.plist",
    "~/Library/Saved Application State/com.engagendy.MClean.savedState",
  ]
end
