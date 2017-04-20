class cron {
	cron{ 'execute':
	command => '/root/abc.sh',
	user => 'root',
	hour => ['1-2'],
	minute => ['*/5'],
	       
	}
}
