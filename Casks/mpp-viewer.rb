cask "mpp-viewer" do
  version "1.0"
  sha256 "091a60c5b4159045701569d6f2b3db51c838e3cd144da5151761d36f265d7e9a"

  url "https://github.com/Engagendy/MPPViewerMacOS/releases/download/v2.0.0/MPPViewer-#{version}-arm64.dmg",
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
