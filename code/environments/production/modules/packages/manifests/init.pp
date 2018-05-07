class packages {
  Package { ensure => 'installed' }
  
    package { 'screen': }
    package { 'vim': }
    package { 'git': }
    package { 'wget': }
    package { 'lsof': }
    package { 'net-tools': }
    package { 'epel-release': }
    package { 'open-vm-tools': }
}
