#!/usr/bin/expect
#usage ./testExpect devName
set devName [lindex $argv 0]
spawn fdisk $devName
expect "Command (m for help)*"
send "n\r"
expect "*Select (default p):"
send "\r"
expect "*Partition number (1-4, default 1):"
send "\r"
expect "First sector*"
send "\r"
expect "*Last sector*"
send "\r"
expect "*Command (m for help):"
send "w\r"
#expect "The partition table has been altered!*"

expect eof
exit
