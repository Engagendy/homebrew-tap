cask "mpp-viewer" do
  version "2.2.22"
  sha256 "aeeb5dcbd151430a9f6ec39a25591fe6737250551b3c63cd5c70dd2b117193be"

  url "https://github.com/Engagendy/MPPViewerMacOS/releases/download/v2.2.22/MPPViewer-#{version}-arm64.dmg",
      verified: "github.com/Engagendy/MPPViewerMacOS/"

  name "MPP Viewer"
  desc "Native macOS viewer for Microsoft Project (.mpp) files"
  homepage "https://github.com/Engagendy/MPPViewerMacOS"

  depends_on macos: ">= :sonoma"

  app "MPPViewer.app"

  postflight do
    # Remove quarantine attributes recursively so the unsigned app
    # and its bundled JRE can launch without Gatekeeper blocking
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/MPPViewer.app"],
                   sudo: true
  end

  zap trash: [
    "~/Library/Caches/com.mppviewer.MPPViewer",
    "~/Library/Preferences/com.mppviewer.MPPViewer.plist",
    "~/Library/Saved Application State/com.mppviewer.MPPViewer.savedState",
  ]
end
