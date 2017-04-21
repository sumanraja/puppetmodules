node node1 {

	class { 'webserver':
	env1 => "production",

}
}
node node2 {
        class { 'webserver':
        env1 => "development",
}

}
node default {
}
