#!/usr/bin/env ruby

class << ((bin = Struct.new(:rb).new).rb = Object.new)
  def do_stuff
    complain_unless_argv
    open_in_editor if already_a_thing?

    write_skeleton
    make_executable
    open_in_editor
  end

  def complain_unless_argv
    (puts "!ARGV.first"; abort) unless name_of_bin
  end

  def open_in_editor
    exec("vim #{path}")
  end

  def make_executable
    exec("chmod +x #{path}")
  end

  def already_a_thing?
    File.exist? path
  end

  def write_skeleton
    File.write(path,
<<-SKELETON
#!/usr/bin/env ruby
require "fileutils"
require "open-uri"
require "pry"

binding.pry
SKELETON
    )
  end

  def path
    @path ||= File.expand_path("~/bin/#{name_of_bin}")
  end

  def fake
    @name_of_bin = '123.fake.sasdftree'
    self
  end

  def name_of_bin
    @name_of_bin ||= ARGV.first
  end
end

bin.rb.do_stuff
