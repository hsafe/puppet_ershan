class localpuppetfile {
  file {'/etc/puppetlabs/puppet/puppet.conf':
    ensure  => 'file',
    source => 'puppet:///modules/localpuppetfile/puppet.conf',
  }

}
