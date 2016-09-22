class xorg {
  package { 'xorg-server':
    ensure => installed,
    name   => xorg-server,
  }
  package { 'xorg-xinit':
    ensure => installed,
    name   => xorg-xinit,
  }
  package { 'xorg-xinput':
    ensure => installed,
    name   => xorg-xinput,
  }
  package { 'xorg-xhost':
    ensure => installed,
    name   => xorg-xhost,
  }
  package { 'xf86-input-libinput':
    ensure => installed,
    name => xf86-input-libinput,
  }
  package { 'xf86-video-intel':
    ensure => installed,
    name => xf86-video-intel,
  }
}
