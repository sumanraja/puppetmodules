class sub {
#	include sub::outer
	class {'sub::outer':
#		var => "test",
		varrouter => "test1",
	}
#	include sub::sub1::inner
#	include ::subnew

}
