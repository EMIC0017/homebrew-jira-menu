cask "jira-menu" do
  version "0.1.0"
  sha256 "8285909b7eacaa38b0c5a2a56327f710d33a4bcad21a668bfc72ddb14f39bcc3"

  url "https://github.com/EMIC0017/jira-menu/releases/download/v#{version}/JiraMenu-v#{version}.zip"
  name "JiraMenu"
  desc "Menubar app for fast Jira Cloud search"
  homepage "https://github.com/EMIC0017/jira-menu"

  app "JiraMenu.app"

  zap trash: [
    "~/Library/Preferences/dev.ericmorin.jiramenu.plist",
    "~/Library/Application Scripts/dev.ericmorin.jiramenu",
    "~/Library/Containers/dev.ericmorin.jiramenu",
  ]
end
