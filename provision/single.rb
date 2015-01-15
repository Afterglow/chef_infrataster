require 'chef/provisioning'

machine_batch 'master' do
  machine 'server1' do
    run_list [
      'recipe[chef_infrataster::server]'
    ]
    add_machine_options :vagrant_options => {
      'vm.hostname' => 'server1'
    }, :vagrant_config => <<-EOM
    config.vm.network 'private_network', ip: '192.168.20.10'
    EOM
  end
end
