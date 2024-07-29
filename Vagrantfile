Vagrant.configure("2") do |config|
    config.vm.box = "gyptazy/rocky9.3-arm64"
    config.vm.box_version = "1.0.2"
    config.vm.hostname = "rocky"
    config.vm.synced_folder ".", "/vagrant",
    config.vm.box_check_update = false
    config.vm.network "private_network", ip: "192.168.85.132"
    config.vm.provider "vmware_fusion" do |vb|
      vb.memory = 3072
      vb.cpus = 2
      vb.ssh_info_public = true
      vb.gui = true
      vb.linked_clone = false
      vb.vmx["ethernet0.virtualdev"] = "vmxnet3"
    end
  end