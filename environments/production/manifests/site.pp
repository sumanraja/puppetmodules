node 'node1' {
        notify {'message1':
                message => "i am node1",
	}
	user {'user1':
	ensure => present,
	uid => '1001',
	password => '$6$Zck1O44a$b6TNiFgmoatmMPOR9XnHOYCZDX9bcVS0xqDaPpHHgQbO2qAdBmKPLn2CuKG7v3rXBqrGzZ97PSMguEVpf2pOB1'
        }
      
}

node node2 {
	notify {'message2':
		message => "i am node2",
	}

}

node default {
        notify {'message':
                message => "i am default m/c",
        }
	file {'/root/filetesting.txt:
	      ensure => present,
	      content => "hello i am in a contaner/n"
	}

}

