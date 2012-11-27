require "foreman/kicker/version"
require "foreman/kicker/executor"
require "foreman/kicker/watchdog"

module Foreman
  module Kicker
    def self.kick
      @watchdog = Foreman::Kicker::Watchdog.new
      @watchdog.start
    end

    def self.stop
      @watchdog.stop
    end
  end
end
