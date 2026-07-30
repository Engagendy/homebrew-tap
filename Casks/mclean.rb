cask "mclean" do
  version "1.1.0"
  sha256 "72c54bf74c2d8ff9377174d91ce3e0ac46082938198305d1f8ee3a294d9c9274"

  url "https://github.com/Engagendy/mclean/releases/download/v1.1.0/theMClean-#{version}-arm64.dmg",
      verified: "github.com/Engagendy/mclean/"

  name "theMClean"
  desc "Native macOS cleanup scanner for cache, temporary, old, and large files"
  homepage "https://github.com/Engagendy/mclean"

  depends_on macos: ">= :sonoma"

  app "theMClean.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/theMClean.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Caches/com.engagendy.MClean",
    "~/Library/Preferences/com.engagendy.MClean.plist",
    "~/Library/Saved Application State/com.engagendy.MClean.savedState",
  ]
end
