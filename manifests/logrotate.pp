# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include monit::logrotate
class monit::logrotate {
  syslog::fullfill_service{ 'monit': module => 'monit', }
}
