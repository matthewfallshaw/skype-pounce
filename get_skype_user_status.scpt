-- This is an AppleScript (in case GitHub doesn't work it out)
on run argv
	if length of argv < 1 then
		-- Probably should return an error or something
		return
	end if
	tell application "Skype"
		return send command "GET USER " & item 1 of argv & " ONLINESTATUS" script name "get_skype_user_status.scpt"
	end tell
end run
