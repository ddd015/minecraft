class minecraft {
  package {'java-18-openjdk':
    ensure => installed
    }
 file {'/opt/minecraft':
   ensure => directory
   }
 include wget
 wget::fetch { "download minecraft":
   source      => 'https://launcher.mojang.com/v1/objects/c8f83c5655308435b3dcf03c06d9fe8740a77469/server.jar',
   destination => '/opt/minecraft/',
   timeout     => 0,
   verbose     => false
   }
 file {'/opt/minecraft/eula.txt':
   ensure => file,
   content => 'eula=true'
   }
 file {'/etc/systemd/system/minecraft.service':
   ensure => file,
   source => 'puppet:///modules/minecraft/minecraft.service'
   }
 ~> service { 'minecraft':
        ensure => running,
        enable => true
   }
  # вроде минекрафт запущен, нужны тесты

}
