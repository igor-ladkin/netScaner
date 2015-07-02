Interconnection.delete_all
Node.delete_all

Node.create!([
  {
    ip_address: '192.168.1.248',
    mac_address: '00:21:f7:77:f7:80',
    type: 'Switch'
  },
  {
    ip_address: '192.168.1.251',
    mac_address: '00:26:f1:39:85:80',
    type: 'Switch'
  },
  {
    ip_address: '192.168.1.252',
    mac_address: '00:1c:2e:97:8d:80',
    type: 'Switch'
  },
  {
    ip_address: '192.168.1.249',
    mac_address: 'de:4e:86:7f:9b:ea',
    type: 'Switch'
  },
  {
    ip_address: '192.168.54.230',
    mac_address: '81:5a:fd:c9:5f:6a',
    type: 'Switch'
  },
  {
    ip_address: '192.168.54.100',
    mac_address: '1e:1f:43:f9:d4:82',
    type: 'Workstation'
  },
  {
    ip_address: '192.168.211.111',
    mac_address: 'f3:b4:9c:13:1b:91',
    type: 'Workstation'
  },
  {
    ip_address: '192.168.1.36',
    mac_address: '4c:88:00:e0:df:2f',
    type: 'Workstation'
  },
  {
    ip_address: '192.168.1.56',
    mac_address: 'd4:1b:14:14:db:b5',
    type: 'Printer'
  }
])

root_switch = Node.find_by(mac_address: '00:21:f7:77:f7:80')
switch_251 = Node.find_by(mac_address: '00:26:f1:39:85:80')
switch_252 = Node.find_by(mac_address: '00:1c:2e:97:8d:80')
switch_249 = Node.find_by(mac_address: 'de:4e:86:7f:9b:ea')
switch_230 = Node.find_by(mac_address: '81:5a:fd:c9:5f:6a')

workstation_100 = Node.find_by(mac_address: '1e:1f:43:f9:d4:82')
workstation_111 = Node.find_by(mac_address: 'f3:b4:9c:13:1b:91')
workstation_36 = Node.find_by(mac_address: '4c:88:00:e0:df:2f')
printer_56 = Node.find_by(mac_address: 'd4:1b:14:14:db:b5')

root_switch.interconnections.create!([
  {
    child_node_id: switch_251.id,
    node_port: 2,
    child_node_port: 1,
    status: 'active'
  },
  {
    child_node_id: switch_252.id,
    node_port: 7,
    child_node_port: 1,
    status: 'active'
  }
])
switch_251.interconnections.create!([
  {
    child_node_id: switch_230.id,
    node_port: 9,
    child_node_port: 1,
    status: 'active'
  }
])
switch_252.interconnections.create!([
  {
    child_node_id: switch_249.id,
    node_port: 17,
    child_node_port: 1,
    status: 'active'
  }
])
switch_230.interconnections.create!([
  {
    child_node_id: workstation_100.id,
    node_port: 2,
    child_node_port: 1,
    status: 'active'
  },
  {
    child_node_id: workstation_111.id,
    node_port: 7,
    child_node_port: 1,
    status: 'down'
  }
])
switch_249.interconnections.create!([
  {
    child_node_id: workstation_36.id,
    node_port: 19,
    child_node_port: 1,
    status: 'active'
  },
  {
    child_node_id: printer_56.id,
    node_port: 8,
    child_node_port: 1,
    status: 'active'
  }
])

puts "Created #{Node.count} nodes"
puts "Created #{Interconnection.count} connections"