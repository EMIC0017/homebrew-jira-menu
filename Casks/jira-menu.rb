cask "jira-menu" do
  version "0.1.3"
  sha256 "85fcf8ad3106ee758cfe855b51660566a438a151287b0930823a5621d4f5afaf"

  url "https://github.com/EMIC0017/jira-menu/releases/download/v#{version}/JiraMenu-v#{version}.dmg"
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
