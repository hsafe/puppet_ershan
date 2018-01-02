class accounts::hsafe {

  user { 'hsafe':
  ensure     => 'present',
  comment    => 'Hamid Safe',
  groups     => ['root', 'wheel'],
  home       => '/home/hsafe',
  managehome => true,
  shell      => '/bin/bash',
  password   => '$6$uLc8nNaj$GUK.6rC7X1Y8s7h7adPBZ4iejqujQAK/1gSVOD9sBLENQKY0nn1UMGeCRBB93Kk80E9avV4SFEw0N5Sz1BwTi0',

  }
  file { '/home/hsafe/.ssh' :
    ensure => 'directory',
    owner  => 'hsafe',
    mode   => '0700',
    }
  file { '/home/hsafe/.ssh/authorized_keys' :
    ensure   => 'present',
    mode     => '0644',
    owner    => 'hsafe',
    content  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1ZCi/K0hlffi9ZUmveJ05l301RE6u/TzrCK+i54edzN5stR/tTjd28vFIup10HTYoZxbqBgRMrxVGDnfwtaSsCZH31g2/flZBxSZGzjySKeUqnf/YyGJP6my/IjA4xcKVcPDPx2FF/u1Sd07y7wnLizjAhtIOwq1daiCcRbXkIxfpobQt/RtJLAyDA1CwACr9NWmAezS0rnaYXRBQrmrkCBx91fMhKsarvxB3z4mTG8wVNwXvE9g2Hps6bRzff0hIXaIoVFYHwqmyIkN+4xCDGcjt3TjZp0zvTK20RR7DNOHxOGs8GBhcvitEkGY/JXgA4AJ26ncfXaspaUgEM/Rt root@devop-testbed
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEArDFBq9FprxDmpnlgVjg5qLezGvG7pN1s0eRDZTAC6HenpRJZmMxs1HzqfKia0K9kDsOrkfW5QK8+KjijieqjAB771eQaS5I21AtpKU3oHd8cNDCi/Bvo/T2VIVlPnlUX3Cxj7dzO68m+SKMQju4+/D/N0RsAdtMwYkheRpwqP20dMDz2iwKkarC9oOWbcY6zC7CQ7SkcG1GM1t9Fe7LoNScOQ+/lp480XE9Jb8BeXr+9EV+bSsvKPWlfPp0tL+4BQirpZIrGnFLNORnDboIL08Ego6FRH5LUZOulf7MOAQD5BcRhwiBzIMn3K7AsqzHVtra3W31IsVDPobJlPqcNTQ== hsafe@thinkx201' ,
  }
}
