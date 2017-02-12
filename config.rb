#!/usr/bin/env ruby
class EquateLocation
    attr_accessor :local, :remote

    def initialize(local, remote)
        @local  = local
        @remote = remote
    end
end

equate_location = EquateLocation.new('vikjam@equity.mit.edu:"/home/vikjam/"')
