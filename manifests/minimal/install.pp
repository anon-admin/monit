class monit::minimal::install(

) inherits monit::conf {
  
  package { "monit":
    ensure  => latest,
  }

}