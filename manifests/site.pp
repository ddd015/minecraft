node 'master' {
include nginx
nginx::resource::server { 'static':
  listen_port => 80,
  proxy => 'http://192.168.56.6:80',
  }
nginx::resource::server { 'dynamic':
  listen_port => 81,
  proxy => 'http://192.168.56.7:80',
  }
}
