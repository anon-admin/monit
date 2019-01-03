class monit::minimal::config (
  $rc_dir = $monit::param::rc_dir,
) inherits monit::minimal::install {


  file { ["/etc/monit/conf.d","/etc/monit/${rc_dir}","/etc/monit"]:
    owner => root,
    group => root,
    mode => '555',
    ensure => directory,
    require => Package["monit"],
  }

  file { "/etc/monit/monitrc":
    owner   => root,
    group   => root,
    mode    => '400',
    require => [Package["monit"], File["/etc/monit/${rc_dir}"]],
  }

    exec { "/usr/bin/find /etc/monit -name '*~' -delete":
      require => File["/etc/monit"],
    }
    
    

}
