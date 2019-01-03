# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include monit::service
class monit::service (

) inherits monit::minimal::service {
  include monit::config

  Service['monit'] {
    enable => true,
    ensure => running,
  }

  include monit::logrotate
}
