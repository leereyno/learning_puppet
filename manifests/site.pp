node default {
}

node 'el71.local' {
  include role::master_server
  file { '/root/README':
    ensure   => file,
    content  => $os,
  }
}

node /^web/ {
  include role::app_server
}

node /^db/ {
  include role::db_server
}

