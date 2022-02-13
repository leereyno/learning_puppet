class minecraft {

  $url = 'https://launcher.mojang.com/v1/objects/125e5adf40c659fd3bce3e66e67a16bb49ecc1b9/server.jar'
  $install_dir = '/opt/minecraft'

  file {$install_dir:
    ensure => directory,
  }

  file {"${install_dir}/server.jar":
    ensure => file,
    source => $url,
    before => Service['minecraft'],
  }

  package {'java-latest-openjdk':
    ensure => present,
  }

  file {"${install_dir}/eula.txt":
    ensure  => file,
    content => 'eula=true'
  }

  file {'/etc/systemd/system/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }

  service {'minecraft':
    ensure  => running,
    enable  => true,
    require => [Package['java-latest-openjdk'],File["${install_dir}/eula.txt"],File['/etc/systemd/system/minecraft.service']],
  }


}

