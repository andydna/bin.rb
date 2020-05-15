#!/usr/bin/env ruby

skeleton = <<-SKELETON
#!/usr/bin/env ruby
require "fileutils"
require "open-uri"
require "pry"

binding.pry
SKELETON

bin = ARGV.first

(puts "!ARGV.first"; abort) unless bin

path = File.expand_path("~/bin/#{bin}")

exec("vim #{path}") if File.exist? path

File.write(path, skeleton)

exec("chmod +x #{path}; vim #{path}")
