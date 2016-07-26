# Adds and configures sftp chroot users.
#
# Recipe:: chroot_users
# Cookbook:: sftp
# Author:: Greg Albrecht <gba@onbeep.com>
# Copyright:: Copyright 2014 OnBeep, Inc.
# License:: Apache License, Version 2.0
# Source:: https://github.com/OnBeep/cookbook-sftp


include_recipe 'users'


# Add sftp users:
users_manage 'sftp' do
  group_id node['sftp']['sftp_group_id']
  action [ :remove, :create ]
end


# Ensure correct permissions for chrooting sftp users:
data_bag(:users).each do |user|
  user_item = data_bag_item('users', user)
  if user_item and user_item['groups'] and user_item['groups'].include?('sftp')
    home = if user_item['home'] and user_item['home'] != "/dev/null"
             user_item['home']
           else
             File.join(node['sftp']['sftp_root'], user_item['id'])
           end

    directory home do
      owner 'root'
      group 'root'
    end

    node['sftp']['sftp_directories'].each do |dir|
      directory File.join(home, dir) do
        owner user_item['id']
      end
    end

    directory File.join(home, '.ssh') do
      action user_item['ssh_keys'] ? :create : :delete
    end
  end
end
