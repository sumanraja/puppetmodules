class demofile {
	file{ '/root/demofile.txt':
	       ensure => present,
#              content => "${osfamily} & ${ipaddress}",
	       source => "puppet:///modules/demofile/test.txt",
	}
}
