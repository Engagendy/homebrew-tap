cask "mpp-viewer" do
  version "2.2.11"
  sha256 "5641bca8fab211dc61d77ca50f4418653f543dd8febb49a99343a719cc24ba12"

  url "https://github.com/Engagendy/MPPViewerMacOS/releases/download/v2.2.11/MPPViewer-#{version}-arm64.dmg",
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
