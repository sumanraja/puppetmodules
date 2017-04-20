class logic {
	if $fqdn == 'puppet' {
	 	file { "/root/${fqdn}":
			ensure => present,
			content => "i am created on host - ${fqdn}",
		}

	}
	elsif $fqdn == 'node1' {
		file{ "/root/${fqdn}":
			ensure => present,
			content => "i am created on host - ${fqdn}",
		
		}
	}
	else {
		notify{ 'n1':
			messege => "none of the hosts matches the condition."
		}
	}


}
