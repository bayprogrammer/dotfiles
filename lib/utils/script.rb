module Utils
  class Script
    def self.commands(*cmds)
      cmds.each do |cmd|
        command(cmd)
      end
    end

    def self.command(cmd, &block)
      if block
        define_method(cmd, &block)
      else
        define_method(cmd) do |*args, &block|
          sh(cmd, *args, &block)
        end
      end
    end

    def method_missing(cmd, *args, &block)
      self.class.command(cmd)
      send(cmd, *args, &block)
    end

    def initialize(debug_mode: false, prefix: '', &block)
      @block = block
      @prefix = prefix
      @debug_mode = debug_mode
    end

    def sh(command, *args, &block)
      args = args.flatten.join(" ")
      command = normalize(prefix("#{command} #{args}"))

      if block
        self.class.new(debug_mode: @debug_mode, prefix: command, &block).run
      else
        puts "RUNNING: #{command}" if @debug_mode
        system(command)
      end
    end

    def run
      instance_eval(&@block)
    end

    private

    def normalize(command)
      command.squeeze(" \n\t").strip.tr("\n", " ")
    end

    def prefix(command)
      "#{@prefix} #{command}"
    end
  end
end

def script(**options, &block)
  ::Utils::Script.new(**options, &block).run
end

module PATH
  def self.prepend(entry)
    update(to_a.prepend(expand(entry)).join(':'))
  end

  def self.append(entry)
    update(to_a.append(expand(entry)).join(':'))
  end

  def self.update(path)
    ENV['PATH'] = path
  end

  def self.to_a
    ENV['PATH'].split(':')
  end

  def self.expand(entry)
    File.expand_path(entry)
  end
end
