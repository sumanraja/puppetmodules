class fact {
	$variable1 = ['/root/file1', '/root/file2']
	exec {'e1':
	       cwd => "/root",
	       command => "/opt/puppetlabs/bin/facter > factordata.txt",
	}
	file { $variable1:
		ensure => present,
		content => "i am the file -${variable1} \n",
}

}
