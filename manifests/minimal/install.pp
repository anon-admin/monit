# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include monit::minimal::install
class monit::minimal::install(

) inherits monit::param {
  package { 'monit': }
}
