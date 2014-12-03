require 'niboshi_json_formatter/version'
require 'rails'

module Niboshi
    class JsonFormatter < ::Logger::Formatter
      def hostname
        @hostname ||= Socket.gethostname
      end

      def tid
        "TID-#{Thread.current.object_id.to_s(36)}"
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
