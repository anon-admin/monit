# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   monit::fullfill_service { 'namevar': }
define monit::fullfill_service(
  $module = 'monit',
  $rc_dir = $monit::minimal::config::rc_dir,
  $has_to_make_available = $monit::minimal::config::has_to_make_available,
) {
  $service_tocheck = $name

  include monit::minimal::service


  file { "/etc/monit/${rc_dir}/${service_tocheck}":
    owner   => root,
    group   => root,
    mode    => '0444',
    source  => "puppet:///modules/${module}/${service_tocheck}.monit.${lsbdistcodename}",
    notify  => Service['monit'],
    require => [Service[$service_tocheck], File["/etc/monit/${rc_dir}"]],
  }
  if ( $has_to_make_available ) {
    monit::make_available { "${service_tocheck}": }
  }

}
