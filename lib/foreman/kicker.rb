require "foreman/kicker/version"
require "foreman/kicker/executor"
require "foreman/kicker/watchdog"

module Foreman
  module Kicker
    def self.port=(port)
      @port = port
    end

    def self.port
      @port
    end

    def self.kick(*args)
      if args.include?('-p') || args.include?('--port')
        self.port = args[(args.find('-p') || args.find('--port')) + 1]
      else
        args += ['-p', port]
      end

      @watchdog = Foreman::Kicker::Watchdog.new
      @watchdog.start(*args.map(&:to_s))
    end

    def self.stop
      @watchdog.stop
    end
  end
end
