cask "jira-menu" do
  version "0.1.4"
  sha256 "1a976a30bba7b1ffcccbf2caa85617ec53d77e316d8315f8fa66f54189d1673b"

  url "https://github.com/EMIC0017/jira-menu/releases/download/v#{version}/JiraMenu-v#{version}.dmg"
  name "JiraMenu"
  desc "Menubar app for fast Jira Cloud search"
  homepage "https://github.com/EMIC0017/jira-menu"

  app "JiraMenu.app"

  # JiraMenu ships unsigned (no Apple Developer cert — see README).
  # Postflight strips com.apple.quarantine, which is enough on macOS 13/14
  # to launch cleanly. On macOS 15+ (Sequoia and later), Apple also tracks
  # apps via com.apple.provenance — a kernel-managed attribute users can't
  # remove — so the first-launch approval has to happen through System
  # Settings. The caveats block below tells the user exactly what to do.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/JiraMenu.app"],
                   sudo: false
  end

  caveats <<~EOS
    JiraMenu is not signed with an Apple Developer ID, so macOS 15+ will
    block the first launch. To approve it:

      1. Try to open the app (Finder or `open /Applications/JiraMenu.app`).
         When the "Not Opened" dialog appears, click Done (NOT Move to
         Trash, which deletes the app).
      2. Open System Settings > Privacy & Security.
      3. Scroll to the bottom and click "Open Anyway" next to the
         "JiraMenu.app was blocked" banner.
      4. Authenticate, then click Open on the final confirmation.

    Each upgrade changes the app's signature hash, so the approval has to
    be redone after `brew upgrade --cask jira-menu`. See:
    https://github.com/EMIC0017/jira-menu#first-launch--approve-the-unsigned-app
  EOS

  zap trash: [
    "~/Library/Preferences/dev.ericmorin.jiramenu.plist",
    "~/Library/Application Scripts/dev.ericmorin.jiramenu",
    "~/Library/Containers/dev.ericmorin.jiramenu",
  ]
end
