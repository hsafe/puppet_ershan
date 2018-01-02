class localrepo{
  package {'yum-plugin-priorities':
    ensure => 'installed',
  }

  file { '/etc/yum.repos.d/local.repo':
    ensure  => 'present',
    source  => 'puppet:///modules/localrepo/local.repo',
    require => Package['yum-plugin-priorities'],
  }
}
