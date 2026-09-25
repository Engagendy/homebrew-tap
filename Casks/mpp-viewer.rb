cask "mpp-viewer" do
  version "2.8.1"
  sha256 "567c89b01824db3a576d23c648785399b11aa36463586c7902af20c072b25450"

  url "https://github.com/Engagendy/MPPViewerMacOS/releases/download/v2.8.1/MPPViewer-#{version}-arm64.dmg",
      verified: "github.com/Engagendy/MPPViewerMacOS/"

  name "Planroom"
  desc "Native macOS viewer for Microsoft Project (.mpp) files"
  homepage "https://github.com/Engagendy/MPPViewerMacOS"

  depends_on macos: ">= :sonoma"

  app "Planroom.app"

  postflight do
    # Remove quarantine attributes recursively so the unsigned app
    # and its bundled JRE can launch without Gatekeeper blocking
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Planroom.app"],
                   sudo: true
  end

  zap trash: [
    "~/Library/Caches/com.mppviewer.MPPViewer",
    "~/Library/Preferences/com.mppviewer.MPPViewer.plist",
    "~/Library/Saved Application State/com.mppviewer.MPPViewer.savedState",
  ]
end
