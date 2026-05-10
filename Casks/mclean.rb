cask "mclean" do
  version "1.0.11"
  sha256 "ed515dc2fc657a233e079f7727e43c1256c1e8608e467a33c5812601bf72f925"

  url "https://github.com/Engagendy/mclean/releases/download/v1.0.11/theMClean-#{version}-arm64.dmg",
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
