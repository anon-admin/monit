# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   monit::make_available { 'namevar': }
define monit::make_available(
) {
  $to_avail = $name

  include monit::minimal::config

  file { "/etc/monit/${monit::minimal::config::enabled_dir}/${to_avail}":
    ensure  => link,
    target  => "../${monit::minimal::config::rc_dir}/${to_avail}",
    require => File["/etc/monit/${monit::minimal::config::rc_dir}/${to_avail}", "/etc/monit/${monit::minimal::config::enabled_dir}"],
  }
}
