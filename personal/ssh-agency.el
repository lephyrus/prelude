(require 'ssh-agency)

(when (or (eq system-type 'windows-nt) (eq system-type 'msdos))
  (setq ssh-agency-bin-dir "C:\\Users\\lrieder\\scoop\\shims"
        ssh-agency-agent-executable "C:\\Users\\lrieder\\scoop\\shims\\ssh-agent.exe"
        ssh-agency-add-executable "C:\\Users\\lrieder\\scoop\\shims\\ssh-add.exe"))
