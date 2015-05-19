# coding: utf-8
require 'spec_helper'

describe Niboshi::JsonFormatter do
  describe "make the app log in JSON format" do
    let(:severity) { "INFO" }
    let(:time) { Time.now }
    let(:program_name) { "RSpec" }
    let(:message) { "Pretz" }
    subject { JSON.parse(Niboshi::JsonFormatter.new.call(severity, time, program_name, message)) }

    it { expect(subject["time"]).not_to be_nil }
    it { expect(subject["formatted_time"]).not_to be_nil }
    it { expect(subject["hostname"]).to eql Socket.gethostname }
    it { expect(subject["pid"]).not_to be_nil }
    it { expect(subject["tid"]).not_to be_nil }
    it { expect(subject["level"]).to eql severity }
    it { expect(subject["program_name"]).to eql program_name }
    it { expect(subject["message"]).to eql message }
  end

  context "cantain illegal utf-8 string" do
    describe "fallback into scrub" do
      let(:severity) { "INFO" }
      let(:time) { Time.now }
      let(:program_name) { "RSpec" }
      let(:message) { "あいうえお".encode("SHIFT_JIS").force_encoding("UTF-8") }
      subject { JSON.parse(Niboshi::JsonFormatter.new.call(severity, time, program_name, message)) }

    it { expect(subject["time"]).not_to be_nil }
    it { expect(subject["formatted_time"]).not_to be_nil }
    it { expect(subject["hostname"]).to eql Socket.gethostname }
    it { expect(subject["pid"]).not_to be_nil }
    it { expect(subject["tid"]).not_to be_nil }
    it { expect(subject["level"]).to eql severity }
    it { expect(subject["program_name"]).to eql program_name }
    it { expect(subject["message"]).to eql "??????????" }
    end
  end

end
