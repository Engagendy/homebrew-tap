cask "mclean" do
  version "1.0.3"
  sha256 "446bc69f9e21b50d847ce121301acc3c0a8c108142cdc611af14308382c5d6ed"

  url "https://github.com/Engagendy/mclean/releases/download/v1.0.3/MClean-#{version}-arm64.dmg",
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
