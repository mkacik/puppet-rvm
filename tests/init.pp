node 'default' {
	user {
		'vagrant':
			ensure => present
	}	

	rvm {
		'vagrant':
			rubies => ['ruby-head', '1.9.3']		
	}
}
