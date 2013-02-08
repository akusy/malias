require "malias/version"
require 'thor'

module Malias
  class Cli < Thor
    include Thor::Actions

    desc "make ALIAS TARGET OPTION: -f \"filename\"", "create alias"
   
    method_option :file, :aliases => "-f"

    def make (name, path)
      if target
        append_file target, "alias #{name}=\'#{path}\'"
        run("source #{target}")
      else
        say "you don't have alias file", :red
      end
    end

    private

    def target
      userfile || bashrc || bashprofile
    end

    def homedir
      Pathname.new(Dir.home)
    end

    def bashrc
      file = homedir.join('.bashrc')
      file if file.exist?
    end

    def bashprofile
      file = homedir.join('.bash_profile')
      file if file.exist?
    end

    def userfile
      return unless options[:file]
      file = Pathname.new(options[:file])
      file if file.exist?
    end
  end
end
