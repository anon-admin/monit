# This module manages monit
#
# @summary This module manages monit
#
# @example
#   include monit
class monit inherits monit::param {
  include monit::service
}
