class monit::conf (
) {
  $rc_dir  = $facts['os.distro.codename']? {
    'xenial' => 'monitrc.d',
    'trusty' => 'monitrc.d',
    default  => 'conf-enabled',
  }
}