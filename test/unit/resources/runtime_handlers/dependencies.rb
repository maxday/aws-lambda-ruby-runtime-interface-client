# Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.

def get_tomorrow(event:, context:)
  require 'active_support'
  ActiveSupport.eager_load!
  t = Time.parse(event['input_time'])
  {tomorrow: t.next_day}
end

def find_dynamic_libs(event:, context:)
  version = ENV['RUBY_VERSION']
  shared_lib_dep = "/var/lang/lib/ruby/#{version}/x86_64-linux/*.so"
  if shared_lib_dep.include? "not found"
    return "Missing dependency"
  end
  'ok'
end
