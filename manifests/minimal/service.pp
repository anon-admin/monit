# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include monit::minimal::service
class monit::minimal::service(

) inherits monit::minimal::config {

  file { '/etc/default/monit':
    owner  => root,
    group  => root,
    mode   => '0444',
    notify => Service['monit'],
  }


  service { 'monit': }

  File['/etc/monit/monitrc'] -> Service['monit']
  File['/etc/monit/monitrc'] ~> Service['monit']

  Exec["/usr/bin/find /etc/monit -name '*~' -delete"] -> Service['monit']
}
