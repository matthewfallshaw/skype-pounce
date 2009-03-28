#!/usr/bin/env ruby

if ARGV.size < 1
	puts "Usage: skype_pounce <username>"
	exit 2
end

user = ARGV[0]
user_status='UNKNOWN'
Dir.chdir(File.dirname(__FILE__))
while user_status != 'ONLINE'
	user_status = `osascript "./get_skype_user_status.scpt" "#{user}"`
	user_status = user_status.split[-1]
	sleep 30 unless user_status == "ONLINE"
end

time = Time.now.ctime
system('growlnotify', '-t', 'Skype Pounce', '-n', 'Skype Pounce', '-s', '-a', 'Skype', '-m', "#{user} is online\n#{time}")
