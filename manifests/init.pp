# use this interfaces
define rvm (
  $user = $name,
  $rubies = [],
  $ensure = present,
) {
  
  rvm::install {
    $user:
      ensure => $ensure,
      require => User[$user]
  }

  # ;_;
  $rubies_for_user = split(inline_template('<%= @rubies.map { |version| "#{@user}/#{version}" }.join(":") %>'), ':')

  case $ensure {
    present,installed: {
      rvm::ruby {
        $rubies_for_user:
          ensure => present
      }
    }
    default: {
      notify { "rubies set to absent for ${user}":; }
    }
  }
}
