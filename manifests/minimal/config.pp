# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include monit::minimal::config
class monit::minimal::config (
  $rc_dir = $monit::param::rc_dir,
  $enabled_dir = $monit::param::enabled_dir,
  $has_to_make_available = $monit::param::has_to_make_available,
) inherits monit::minimal::install {

  file { '/etc/monit':
    owner   => root,
    group   => root,
    mode    => '0555',
    ensure  => directory,
    require => Package['monit'],
  }

  if ( $has_to_make_available ) {
    file { "/etc/monit/${enabled_dir}":
      owner   => root,
      group   => root,
      mode    => '0555',
      ensure  => directory,
      require => [ Package['monit'], File['/etc/monit'] ],
    }
    File["/etc/monit/${enabled_dir}"] -> File['/etc/monit/monitrc']
  }

  file { "/etc/monit/${rc_dir}":
    owner   => root,
    group   => root,
    mode    => '0555',
    ensure  => directory,
    require => [ Package['monit'], File['/etc/monit'] ],
  }
  File["/etc/monit/${enabled_dir}"] -> File['/etc/monit/monitrc']


  file { '/etc/monit/monitrc':
    owner   => root,
    group   => root,
    mode    => '0400',
    require => [ Package['monit'], File['/etc/monit'] ],
  }

  exec { "/usr/bin/find /etc/monit -name '*~' -delete":
    require => File["/etc/monit"],
  }

}
