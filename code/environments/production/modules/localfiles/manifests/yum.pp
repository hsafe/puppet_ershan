class localfiles::yum {
  file {'/etc/yum.conf' :
    ensure => 'file',
    source => 'puppet:///modules/localfiles/yum.conf',
  }
}
