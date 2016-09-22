class bspwm {
  package { 'bspwm':
    ensure => installed,
    name => bspwm,
  }
  file { 'bspwmrc':
    ensure => present,
    path => '/home/anton/.config/bspwm/bspwmrc',
    source => 'puppet:///modules/bspwm/bspwmrc',
    mode => '0777',

  }
}
