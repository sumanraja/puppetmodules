class webserver ($env1 = "test") {
	file { '/usr/share/nginx/html/index.html':
		content => template('webserver/index.html.erb'),
		notify => Service['nginx'],
	}
	service { 'nginx':
		ensure => running,
		enable => true,
		require => Package['nginx'],
	}
	package { 'nginx':
		ensure => installed,
	} 

}
