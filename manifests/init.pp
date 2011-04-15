class guifi_graph_server {
  include guifi_repo
  package {
    "snpservices":
      ensure => present,
      require => File["/etc/apt/apt.conf.d/99unauth"];
  }
  file {
    "/etc/snpservices/config.php":
      content => template("guifi_graph_server/snpservices/config.php.erb"),
      require => Package["snpservices"];
  }
}

class guifi_repo {
  file {
    "/etc/apt/sources.list.d/guifi.list":
      content => "deb http://repo.vic.guifi.net/debian/ ./",
      notify => Exec["apt-get update"],
      require => File["/etc/apt/apt.conf.d/99unauth"];
    "/etc/apt/apt.conf.d/99unauth":
      content => "APT::Get::AllowUnauthenticated 1;";
  }
}
