#!/usr/bin/ruby

if ARGV.size < 1
	puts "Usage: skype_pounce <username>"
	exit 2
end

user = ARGV[0]
user_status='UNKNOWN'
while user_status != 'ONLINE'
	sleep 30
	# XXX You will need to change this path if you are not wmoore
	user_status = `osascript "/Users/wmoore/Source/get_skype_user_status.scpt" "#{user}"`
	user_status = user_status.split[-1]
end

system('growlnotify', '-n', 'Skype Pounce', '-t', 'Skype Pounce', '-m', "#{user} is online")
