class profile::agent_nodes {
  include dockeragent
  dockeragent::node {'web.puppet.vm':}
  dockeragent::node {'db.puppet.vm':}

  host {'el71.local':
    ensure => present,
    ip     => 192.168.1.114
  }

  host {'web.puppet.vm':
    ensure => present,
    ip     => 172.18.0.2
  }
  host {'db.puppet.vm':
    ensure => present,
    ip     => 172.18.0.3
  }
}

