class localusers {
        user {'hsafe':
        ensure     => 'present',
        comment    => 'Hamid Safe',
        home       => '/home/hsafe',
        groups     => [ 'hsafe', 'wheel'],
        managehome => true,
        password   => '$6$xCBwHtpn$EH/WGzNU6qflF5zBxs7VK75rryvq.DwRiCxgS9.h5txLV/QpR7LJ3Rnc/kihDumqki6r38XxbWZT/JFcymUs41',
        shell      => '/bin/bash',
        }
}

