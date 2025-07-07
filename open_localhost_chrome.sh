#!/bin/bash

osascript <<END
tell application "Google Chrome"
  activate
  set localhost_found to false
  repeat with w in windows
    set i to 0
    repeat with t in tabs of w
      set i to i + 1
      if (URL of t as string) starts with "http://localhost:3000" then
        set active tab index of w to i
        set index of w to 1
        set localhost_found to true
        exit repeat
      end if
    end repeat
    if localhost_found then exit repeat
  end repeat
  if not localhost_found then
    open location "http://localhost:3000"
  end if
end tell
END
