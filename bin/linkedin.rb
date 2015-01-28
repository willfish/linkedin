#!/usr/bin/env ruby

require 'bundler/setup'
require 'trollop'

config = Trollop::options do
  opt :input_dir, "Specify an rds instance to validate.", type: String, required: true
  opt :output_dir, "List most recent snapshots.", type: String, required: true
end

files = Dir.entries(config[:input_dir]).map {|file| File.join(input_dir,file)}
output = config[:output_dir]

MyDrive::Linkedin::Connection.new(files,output)
