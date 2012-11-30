require "foreman/kicker/version"
require "foreman/kicker/executor"
require "foreman/kicker/watchdog"

module Foreman
  module Kicker
    def self.kick(*args)
      @watchdog = Foreman::Kicker::Watchdog.new
      @watchdog.start(*args)
    end

    def self.stop
      @watchdog.stop
    end
  end
end
