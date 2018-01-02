class apache {
    package {'httpd':
      ensure =>  installed,
    }
    package { 'php':
      ensure  => installed,
      require =>  Package [ 'httpd' ]
    }
    service {'httpd':
      ensure  => running,
      require => Package ['http']
      enable  =>  true,
    }
    file {'/etc/httpd/conf/httpd.conf':
      ensure  => present,
      content => "puppet:///module/httpd/httpd.conf",
      require => Package['httpd']
      notify  =>  Service['httpd']
    }

}

-------a Node classification with roles and profiles sample------

class profiles::base{
  include ::accounts
  include ::security
  include ::repos
  class {'::ntp':
    server => [ 'ntp1.corp.com', 'ntp2.corp.com' ],
  }
} 

class profiles::web {
  include ::apache
  include ::php
}
class profiles::db{
  include ::mysql
}
class roles::webserver {
  include ::profiles::base
  include ::profiles::web
}
class roles::webserver::dev {
  include ::profiles::base
  include ::profiles::web
  include ::profiles::db
}


--------Resource declaration with an each loop-----------------
$files = [
  '/etc/puppet/puppet.conf',
  '/etc/puppet/auth.conf',
  '/etc/puppet/routes.yaml',
]
$files.each |$file| {
  file { $file:
    ensure  => 'file',
    content => template("puppet/${basename($file)}"),
    group   => 'root',
    mode    => '0444',
    owner   =>  'root',
  }
}


---------another example Directory creation using arrays---------------------------------------
$directories = [
  '/tmp',
  '/tmp/example1',
  '/tmp/example2',
  '/tmp/example1/foo',
  '/tmp/example1/bar',
]
file { $directories:
  ensure => 'directory',
    mode => '0755',
}



