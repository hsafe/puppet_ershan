# Class: snmp
# ===========================
#
# Full description of class snmp here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'snmp':
#      servers        => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class snmp {
     Package { ensure =>  'installed' }
       package { 'net-snmp': }
       package { 'net-snmp-utils': }
       package { 'net-snmp-devel': }

     file { '/etc/snmp/snmpd.conf':
      source  => 'Puppet:///modules/snmp/snmpd.conf',
      ensure  => 'present',
     }
     service { 'snmpd':
      ensure  => 'running',
      enable  => true,
#      require => Package ['net-snmp','net-snmp-utils','net-snmp-devel':],
#      require => Package['net-snmp-utils'],
#      require =>  File[ '/etc/snmp/snmpd.conf' ],
     }
#     firewall {'open up the snmp':
#      port   => '161',
#      proto  => ['tcp', 'udp' ],
#      action => 'accept',
#    }
}
