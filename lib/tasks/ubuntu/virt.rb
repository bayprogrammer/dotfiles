namespace :ubuntu do
  desc 'ubuntu virtualization & containers'
  task virt: :base do
    apt_packages = %w(
      docker.io
      docker-compose
      docker-doc

      rkt
      systemd-container

      qemu-kvm
      qemu-utils
      qemu-system
      qemu-user

      libvirt-daemon-system
      virt-manager
    )

    snap_packages = %w(
      lxd
      multipass
    )

    script do
      sudo do
        apt :install, '-y', apt_packages

        snap_packages.each do |snap_pkg|
          snap :install, snap_pkg
        end
      end
    end
  end
end
