#!/usr/bin/env ruby

skeleton = <<-SKELETON
#!/usr/bin/env ruby
require "fileutils"
require "open-uri"
require "pry"

binding.pry
SKELETON

bin = ARGV.first

abort "!ARGV" unless bin

path = File.expand_path("~/bin/#{bin}")

exec("vi #{path}") if File.exist? path

File.write(path, skeleton)

exec("chmod +x #{path}; vi #{path}")
