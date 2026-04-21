cask "jira-menu" do
  version "0.1.2"
  sha256 "676e606bf683049a4f2ddd7633f0ea5d27f10377f85f85ba443af454c5248816"

  url "https://github.com/EMIC0017/jira-menu/releases/download/v#{version}/JiraMenu-v#{version}.zip"
  name "JiraMenu"
  desc "Menubar app for fast Jira Cloud search"
  homepage "https://github.com/EMIC0017/jira-menu"

  app "JiraMenu.app"

  # JiraMenu ships unsigned (no Apple Developer cert — see README).
  # Homebrew removed `--no-quarantine` in v5, so we strip the quarantine
  # attribute ourselves in postflight. Without this, Gatekeeper blocks
  # the first launch with "Apple cannot check this app for malware."
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/JiraMenu.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/dev.ericmorin.jiramenu.plist",
    "~/Library/Application Scripts/dev.ericmorin.jiramenu",
    "~/Library/Containers/dev.ericmorin.jiramenu",
  ]
end
