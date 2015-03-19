#!/usr/local/bin/env ruby
require 'thor'

class equate < Thor
    desc "Simple wrapper for rsync to Equity"
    def push(folder)
        `echo "Sending contents #{folder} to #{folder}" && osascript -e 'display notification "Terminal is done!" with title "Terminal" sound name "Frog"'`
    end

    def pull(folder)
        `echo "Grabbing contents of #{folder} to #{folder}" && osascript -e 'display notification "Terminal is done!" with title "Terminal" sound name "Frog"'`
    end
end

equate.start(ARGV)

