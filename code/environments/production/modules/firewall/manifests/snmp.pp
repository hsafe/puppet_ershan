class firewall::snmp {
#  Firewall {
#    require => undef,
#  }
#  firewall {'snmp':
    proto  => 'snmp',
    action => 'accept',
#  }
}
