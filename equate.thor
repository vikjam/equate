#!/usr/bin/env ruby
require 'rubygems'
require 'thor'

class Equate < Thor
    
    desc "push FOLDER", "send FOLDER to remote server"
    def push(folder)
        push_rsync  = %Q[rsync -chavzP --stats '#{Dir.pwd}/#{folder}' 'vikjam@equity.mit.edu:/home/vikjam/PS3/']
        push_notify = %Q[osascript -e 'display notification "Sent #{folder}!" with title "Terminal" sound name "Frog"']

        # Compile string and send to command line
        cmd = "#{push_rsync} && #{push_notify}"
        system("#{cmd}")
    end

    desc "pull FOLDER", "grab FOLDER from remote server"
    def pull(folder)
        pull_rsync  = %Q[rsync -chavzP --stats 'vikjam@equity.mit.edu:/home/vikjam/PS3/#{folder}' '#{Dir.pwd}']
        pull_notify = %Q[ osascript -e 'display notification "Grabbed #{folder}!" with title "Terminal" sound name "Frog"']
        
        # Compile string and send to command line
        cmd = "#{pull_rsync} && #{pull_notify}"
        system("#{cmd}")
    end
end

