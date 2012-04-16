#
# This is a class that wraps
# the puppetlabs-apache module to
# create the easiest demo possible
#
class apache_demo {

  class { 'apache': }
  apache::vhost { 'apache_demo':
    port => '80',
    docroot => '/opt/apache_demo/',
    configure_firewall => false,
    ssl => false,
  }
  file { '/opt/apache_demo/':
    ensure => directory,
  }
  file { '/opt/apache_demo/index.html':
    source => 'puppet:///modules/apache_demo/index.html'
  }

}
