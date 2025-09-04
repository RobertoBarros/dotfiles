#!/bin/bash

case "$1" in
  localhost)
    URL="http://localhost:3000"
    ;;
  youtube)
    URL="https://www.youtube.com"
    ;;
  gmail)
    URL="https://mail.google.com"
    ;;
  chatgpt)
    URL="https://chatgpt.com/"
    ;;
  *)
    echo "Alias '$1' not found."
    exit 1
    ;;
esac

osascript <<END
tell application "Google Chrome"
  activate
  set target_url to "$URL"
  set url_found to false
  repeat with w in windows
    set i to 0
    repeat with t in tabs of w
      set i to i + 1
      if (URL of t as string) starts with target_url then
        set active tab index of w to i
        set index of w to 1
        set url_found to true
        exit repeat
      end if
    end repeat
    if url_found then exit repeat
  end repeat
  if not url_found then
    open location target_url
  end if
end tell
END
