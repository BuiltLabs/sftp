# default Attributes for SFTP chroot server.
#
# Attributes:: default
# Cookbook:: sftp
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/OnBeep/cookbook-sftp
#


default['sftp']['sftp_group_id'] = 2012
default['sftp']['sftp_root'] = '/sftp'
default['sftp']['sftp_directories'] = [ 'upload' ]
