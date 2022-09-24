#!/usr/bin/env ruby
require 'rubygems'
require 'thor'
require 'warning'
Warning.ignore(/deprecated/)

class Equate < Thor

    desc "push FOLDER", "send FOLDER to remote server"
    method_option :delete, :type => :boolean, :desc => "Delete files in remote if not in local"
    method_option :remote, :required => true, :desc => "Remote server name"
    method_option :path, :required => true, :desc => "Path prefix on remote servers"
    def push(folder)
        # Parse options
        delete_opt = ""
        if options[:delete]
            delete_opt = "--delete"
        end
        # Get working directory
        local_dir = Dir.getwd().gsub(Regexp.new(Dir.home()), "").gsub(/^\//, "")
        push_rsync  = %Q[rsync -chavzP --stats #{delete_opt} '#{Dir.pwd}/#{folder}' '#{options[:remote]}:"#{options[:path]}/#{local_dir}"']
        push_notify = %Q[osascript -e 'display notification "Sent #{folder}!" with title "Terminal" sound name "Tink"']
        # Compile string and send to command line
        cmd = "#{push_rsync} && #{push_notify}"
        system("#{cmd}")
    end

    desc "pull FOLDER", "grab FOLDER from remote server"
    method_option :delete, :type => :boolean, :desc => "Delete files in local if not in remote"
    method_option :remote, :required => true, :desc => "Remote server name"
    method_option :path, :required => true, :desc => "Path prefix on remote servers"
    def pull(folder)
        # Parse options
        delete_opt = ""
        if options[:delete]
            delete_opt = "--delete"
        end
        # Get working directory
        local_dir = Dir.getwd().gsub(Regexp.new(Dir.home()), "").gsub(/^\//, "")
        pull_rsync  = %Q[rsync -chavzP --stats #{delete_opt} '#{options[:remote]}:"#{options[:path]}/#{local_dir}/#{folder}"' '#{Dir.pwd}']
        pull_notify = %Q[osascript -e 'display notification "Grabbed #{folder}!" with title "Terminal" sound name "Tink"']
        # Compile string and send to command line
        cmd = "#{pull_rsync} && #{pull_notify}"
        system("#{cmd}")
    end
end

