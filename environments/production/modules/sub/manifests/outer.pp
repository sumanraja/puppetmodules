class sub::outer { 
		$varouter = "I in class sub::outer"
	file { '/root/outer':
		ensure => present,
		content => "${::varouter}",
	}
}
