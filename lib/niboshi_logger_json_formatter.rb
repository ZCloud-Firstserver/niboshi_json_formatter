require "niboshi_logger_json_formatter/version"

module Niboshi
  module Logger
    class JsonFormatter < Logger::Formatter
      def hostname
        @hostname ||= Socket.gethostname
      end

      def tid
        Thread.current.object_id
      end

      def call(severity, time, program, msg)
        {
          time: time.to_f,
          formatted_time: time,
          hostname: hostname,
          pid: $$,
          tid: tid,
          level: severity,
          message: msg
        }.to_json + "\n"
      end
    end
  end
end
