class runnnig_services {
  Service { ensure => 'running' }
  
    service { 'jasperreport': }
    service { 'haproxy': }
    service { 'memcached': }
    service { 'elasticsearch': }
    service { 'ntpd': }
}
