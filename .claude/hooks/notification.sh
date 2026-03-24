#!/usr/bin/env bash
# notification.sh — Notify user that human action may be required
# Receives notification data as JSON on stdin

INPUT=$(cat)
MESSAGE=$(echo "$INPUT" | grep -oP '"message"\s*:\s*"\K[^"]+' 2>/dev/null || true)
TITLE=$(echo "$INPUT" | grep -oP '"title"\s*:\s*"\K[^"]+' 2>/dev/null || "Claude Code")

if [[ -z "$MESSAGE" ]]; then
  MESSAGE="Ação humana necessária"
fi

# Bell character (immediate, works in all terminals)
printf "\a"

# Windows toast notification via PowerShell (Windows 10/11)
if command -v powershell.exe &>/dev/null; then
  powershell.exe -NoProfile -NonInteractive -Command "
    \$notify = New-Object System.Windows.Forms.NotifyIcon
    Add-Type -AssemblyName System.Windows.Forms
    \$notify = New-Object System.Windows.Forms.NotifyIcon
    \$notify.Icon = [System.Drawing.SystemIcons]::Information
    \$notify.Visible = \$true
    \$notify.ShowBalloonTip(5000, '$TITLE', '$MESSAGE', [System.Windows.Forms.ToolTipIcon]::Info)
    Start-Sleep -Milliseconds 5500
    \$notify.Dispose()
  " 2>/dev/null || true
fi

echo "[Claude Code] $TITLE: $MESSAGE"
exit 0
