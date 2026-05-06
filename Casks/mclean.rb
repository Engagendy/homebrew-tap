cask "mclean" do
  version "1.0.2"
  sha256 "5da9190967bc415b56024c17f49c5849222786746db4108eeb6bc14db414e38e"

  url "https://github.com/Engagendy/mclean/releases/download/v1.0.2/MClean-#{version}-arm64.dmg",
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
