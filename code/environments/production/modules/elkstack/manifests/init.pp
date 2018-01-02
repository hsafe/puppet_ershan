# Class: elkstack
# ===========================
#
# Full description of class elkstack here.
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
#    class { 'elkstack':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#Hamid Safe
# Author Name <hsafe@github.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
                                    #Notice
## This module is only specifically is targetting rpm rhl 64 bit linux machines ##
class elkstack {
  package { 'filebeat' :
    ensure          => 'present',
    install_options =>  [ {'--disablerepo' => '*'} , {'--enablerepo' => 'local_repo'} ],
    name            => 'filebeat-1.3.1-x86_64.rpm',
  }
  service { 'filebeat' :
    ensure   => 'running',
    enable   =>  'true',
  }
  file { '/etc/pki/tls/certs/logstash-forwarder.crt':
    ensure  => 'present',
    source => "puppet:///modules/elkstack/logstash-forwarder.crt",
  }

  file { '/etc/filebeat/filebeat.yml':
    ensure  => 'present',
    source => "puppet:///modules/elkstack/filebeat.yml",
  }
  file { '/tmp/test.txt' :
    ensure  => 'present',
    content =>  'the test',
  }
  
}
