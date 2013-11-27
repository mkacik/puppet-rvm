# DO NOT USE DIRECTLY
class rvm::requirements {
  $packages = [
    'curl',
    'git-core',
    'libreadline6-dev',
    'zlib1g-dev',
    'libssl-dev',
    'libyaml-dev',
    'libsqlite3-dev',
    'sqlite3',
    'libxml2-dev',
    'libxslt1-dev',
    'autoconf',
    'libgdbm-dev',
    'libncurses5-dev',
    'automake',
    'libtool',
    'bison',
    'pkg-config',
    'libffi-dev',
    'gawk'
  ]

  package {
    $packages:
      ensure => installed
  }
}
