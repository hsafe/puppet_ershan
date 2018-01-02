class vim { 
 file { '/root/.vim':
    ensure => directory,
    source => 'puppet:///modules/vim/vim',
  }
}

