cask "mclean" do
  version "1.0.10"
  sha256 "31d4888fdd7411e519951d2d9fbdda011ca632e19df4e9c26626cbedc3f61b96"

  url "https://github.com/Engagendy/mclean/releases/download/v1.0.10/theMClean-#{version}-arm64.dmg",
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
