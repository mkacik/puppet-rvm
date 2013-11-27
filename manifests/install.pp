# DO NOT USE DIRECTLY
define rvm::install (
  $user = $name,
  $ensure = present
) {
	require rvm::requirements
  
	case $ensure {
    present,installed: {
      notify { "rvm set to be present for ${user}":; }

      exec {
        "fetch rvm installer for ${user}":
          command => 'curl -o ./rvm-installer.sh -L https://get.rvm.io',
          user => $user,
          cwd => "/home/${user}",
          creates => "/home/${user}/rvm-installer.sh",
          path => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
      }

      exec {
        "install rvm without rubies for ${user}":
          command => "env -i HOME=/home/${user} bash ./rvm-installer.sh stable --autolibs=fail",
          user => $user,
          cwd => "/home/${user}",
          creates => "/home/${user}/.rvm/VERSION",
          path => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
          require => Exec["fetch rvm installer for ${user}"]
      }
    }
    default: {
      notify { "rvm set to be absent for ${user}":; }

      exec {
        "implode rvm installation for ${user}":
          command => "su - ${user} -c 'echo yes | rvm implode'",
          onlyif => "su - ${user} -c 'which rvm'",
          path => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
      }

      $absent_files = [ "/home/${user}/.rvm",
                        "/home/${user}/rvm-installer.sh",
                        "/home/${user}/.rvmrc" ]

      file {
        $absent_files:
          ensure => absent,
          require => Exec["implode rvm installation for ${user}"]
      }
    }
  }
}
