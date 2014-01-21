# Vagrant Install Scripts

This is a collection of Bourne-Again SHell scripts to install various softare on Ubuntu Linux.

These are designed to be used in combination with Vagrant.

An example config line in a Vagrantfile would be:

```ruby
VAGRANT_FILES = '/path/to/directory/containing/these/scripts'
config.vm.provision :shell, :path => "#{VAGRANT_FILES}/nodejs.sh"
```

They are all intended to be run with superuser privileges except for the ruby
install because it installs the shim into the user's home directory.
It would be used like so:

```ruby
config.vm.provision :shell, :privileged => false, :path => "#{VAGRANT_FILES}/ruby.sh"
```

These were taken from a project so should be changed to suit your needs.

Check the individual files for additional information pertaining to each piece
of software.
