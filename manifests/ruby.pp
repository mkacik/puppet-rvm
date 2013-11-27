# DO NOT USE DIRECTLY
define rvm::ruby (
  $ensure = present
) {
  $user = regsubst($name, '^(\w*)\/(.*)$', '\1')
  $version = regsubst($name, '^(\w*)\/(.*)$', '\2')
  
  case $ensure {
    present,installed: {
      notify { "${version} set to be present for ${user}":; }

      exec {
        "install ruby ${version} for ${user}":
          command => "su - ${user} -c '/home/${user}/.rvm/bin/rvm install ${version}'",
          timeout => 0,
          unless => "su - ${user} -c '/home/${user}/.rvm/bin/rvm list strings | grep ${version}'",
          path => ['/bin', '/sbin', '/usr/bin', '/usr/sbin'],
          require => Rvm::Install[$user],
      }
    }
    default: {
      notify { "${version} set to be absent for ${user}":; }
    }
  }
}
