class accounts::puppet {

  user { 'puppet':
  ensure     => 'present',
  comment    => 'puppet server',
  groups     => ['root', 'wheel'],
  home       => '/home/puppet',
  managehome => true,
  shell      => '/bin/bash',
  password   => '$6$uLc8nNaj$GUK.6rC7X1Y8s7h7adPBZ4iejqujQAK/1gSVOD9sBLENQKY0nn1UMGeCRBB93Kk80E9avV4SFEw0N5Sz1BwTi0',

  }
  file { '/home/puppet/.ssh' :
    ensure => 'directory',
    owner  => 'puppet',
    mode   => '0700',
    }
  file { '/home/puppet/.ssh/authorized_keys' :
    ensure   => 'present',
    mode     => '0644',
    owner    => 'puppet',
    content  => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJMJw2Wm4vzBN+FCfyBe138F2Q+B3H06ogwY+WXhwH0Tg9M+huQ9DQ41F63aFzyg3qLEuvNta4M+1k+LHruBScVQKjKGMB8lkumVaI9FarD6vLb5KP7L+Ar3MOnXAisZkv+YazGvL3rCQ9L7Z8CrL8y29/7IFdfVoqPoQ6xV2G/8hAhf3wGFMi+VBqD8J0AK47rWEShqpe+E/7ZDyKCXb4sUuqa8Pznvrrs92SZlxprHEqL+NeOALuW0a8+Avx5yJCZAHkN272QZ6ryIB7vOhT1RlS1pJSuoSu7A19deQXVcHf3azVFuVBsGNsu94RTPIhPTMgbMF6KxEWGk9nKtmX root@puppet' ,
  }
}
