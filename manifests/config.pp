class monit::config (

) inherits monit::minimal::config {

  include monit::install

  File["/etc/monit/monitrc"] {
    source  => "puppet:///modules/monit/monitrc",
  }

}