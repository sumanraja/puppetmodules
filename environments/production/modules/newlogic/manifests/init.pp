class newlogic {
	$newvar = $fqdn ? { 'puppet' => 'puppetmaster', 'node1' => 'puppetclient', 'default' => 'newvar' }
	if $fqdn == 'puppet' {
	 	file { "/root/${fqdn}":
			ensure => present,
			content => "i am created on host - ${newvar}",
		}

	}
	elsif $fqdn == 'node1' {
		file{ "/root/${fqdn}":
			ensure => present,
			content => "i am created on host - ${newvar}",
		
		}
	}
	else {
		notify{ 'n1':
			messege => "none of the hosts matches the condition."
		}
	}


}
