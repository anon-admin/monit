# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include monit::conf
class monit::param (

) inherits conf::lsbdist {
  $rc_dir  = $conf::lsbdist::codename ? {
    'xenial' => 'monitrc.d',
    'trusty' => 'monitrc.d',
    'wheezy' => 'monitrc.d',
    'jessie' => 'monitrc.d',
    default  => 'conf-enabled',
  }
  $enabled_dir  = $rc_dir ? {
    'monitrc.d' => 'conf.d',
    'conf-available' => 'conf-enabled',
    default  => $rc_dir,
  }
  $has_to_make_available = ( $rc_dir != $enabled_dir )
}
