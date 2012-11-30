module Foreman
  module Kicker
    class Executor
      attr_reader :pid

      def run(*args)
        fork_exec(args)
        wait
      end

      private
      def fork_exec(args)
        @pid = fork do
          puts "Executing `foreman start #{args.join(' ')}`"

          Process.setpgid(0, 0)
          Process.exec('foreman', 'start', *args)
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