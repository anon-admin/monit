define monit::fullfill_service(
  $module = "monit",
  $rc_dir = $monit::minimal::config::rc_dir,
) {
  $service_tocheck = $name

  include monit::minimal::service


  file { "/etc/monit/${rc_dir}/${service_tocheck}":
    owner   => root,
    group   => root,
    mode    => 444,
    source  => "puppet:///modules/${module}/${service_tocheck}.monit.${lsbdistcodename}",
    notify  => Service["monit"],
    require => [Service["${service_tocheck}"], File["/etc/monit/${rc_dir}"]],
  }

  monit::make_available { "${service_tocheck}": }

}