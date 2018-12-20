class monit::install inherits monit::minimal::install {

  Package["monit"] {
    ensure  => latest,
  }

  include conf::install::apt
  
  File["/etc/apt/sources.list"] -> Package["monit"]
}