# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include monit::install
class monit::install inherits monit::minimal::install {
  Package['monit'] {
    ensure  => latest,
  }

  include conf::install::apt

  File['/etc/apt/sources.list'] -> Package['monit']
}
