module Foreman
  module Kicker
    class Executor
      attr_reader :pid

      def run
        fork_exec
        wait
      end

      private
      def fork_exec
        @pid = fork do
          Process.setpgid(0, 0)
          Process.exec('foreman', 'start')
        end
      end

      def wait
        Process.waitpid(@pid)
      rescue Errno::ESRCH
        # ignored
      end
    end
  end
end