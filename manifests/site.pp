node default {
}

node 'el71.local' {
  include role::master_server
  file { '/root/README':
    ensure   => file,
    content  => "Welcome to ${fqdn}, which is running $virtual\n"
  }
}

node 'minetest.puppet.vm' {
  include role::minecraft_server
}

node /^web/ {
  include role::app_server
}

node /^db/ {
  include role::db_server
}

