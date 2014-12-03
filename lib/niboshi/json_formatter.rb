require "logger"
require "json"

module Niboshi
  class JsonFormatter < ::Logger::Formatter
    Version = VERSION = "0.1.0"

    def hostname
      @hostname ||= Socket.gethostname
    end

    def tid
      Thread.current.object_id
    end

    def call(severity, time, program_name, message)
      {
        time: time.to_f,
        formatted_time: time,
        hostname: hostname,
        pid: $$,
        tid: tid,
        level: severity,
        program_name: program_name,
        message: message
      }.to_json + "\n"
    end
  end
end
