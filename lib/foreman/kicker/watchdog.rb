module Foreman
  module Kicker
    class Watchdog
      def start(*args)
        @pid = fork do
          trap(:TERM) do
            terminate(@executor.pid)
            Kernel.exit(0)
          end

          loop do
            @executor = Executor.new
            @executor.run(*args)
          end
        end
      end

      def stop
        terminate(@pid)
      end

      private
      def terminate(pid)
        Process.kill('TERM', pid)
        Process.waitpid(pid)
      rescue Errno::ESRCH, Errno::ECHILD
        # ignored
      end
    end
  end
end
