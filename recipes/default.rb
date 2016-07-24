# Installs & Configures SFTP chroot server.
#
# Recipe:: default
# Cookbook:: sftp
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/OnBeep/cookbook-sftp
#

include_recipe 'openssh'
include_recipe 'sftp::chroot_users'
