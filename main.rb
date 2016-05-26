#!/usr/bin/env jruby

require 'optparse'
require './lib/bootstrapper'

options = {}
OptionParser.new do |opts|
  opts.on('--monitor-queue', 'Monitor Queue') do |_v|
    options[:class] = 'MonitorQueue'
    options[:action] = :run
    options[:method_type] = :class
  end

  opts.on('--queue-files', 'Queue files to import') do |_v|
    options[:class] = 'QueueFilesWorker'
    options[:action] = :perform_async
    options[:method_type] = :class
  end
end.parse!

raise 'Nothing to do!' if options[:action].nil?

begin
  klass = Object.const_get options[:class]
  if options[:method_type] == :class
    # class method
    klass.send options[:action]
  else
    # instance method
    instance = klass.new
    instance.send options[:action]
  end
rescue => e
  # debug..
end
