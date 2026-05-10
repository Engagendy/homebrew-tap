cask "mclean" do
  version "1.0.9"
  sha256 "822777fe85a24fcf7ab2ca8e5c7bf6d5ff1ec811414406b38a9ee55f88c7bf50"

  url "https://github.com/Engagendy/mclean/releases/download/v1.0.9/theMClean-#{version}-arm64.dmg",
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
