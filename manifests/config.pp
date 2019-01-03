# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include monit::config
class monit::config (

) inherits monit::minimal::config {
  include monit::install

  File['/etc/monit/monitrc'] {
    source  => "puppet:///modules/monit/monitrc",
  }
}
