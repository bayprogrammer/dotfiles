module ANSI

  # http://www.lihaoyi.com/post/BuildyourownCommandLinewithANSIescapecodes.html
  # https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
  # https://cwoebker.com/posts/ansi-escape-codes
  # https://en.wikipedia.org/wiki/ANSI_escape_code#SGR_(Select_Graphic_Rendition)_parameters
  # http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-048.pdf

  # TODO(zmd): @Future: support additional commands
  COMMANDS = {
    :reset => '0'
  }

  EFFECTS = {
    :bold         => '1',
    :un_bold      => '22',

    :faint        => '2',
    :un_faint     => '22',

    :italic       => '3',
    :un_italic    => '23',

    :underline    => '4',
    :un_underline => '24',

    :blink        => '5',
    :un_blink     => '25',

    :blink_fast   => '6',
    :unblink_fast => '26',

    :reverse      => '7',
    :un_reverse   => '27'
  }

  COLORS = {
    :default => {fg: '39', bg: '49'},

    :black   => {fg: '30', bg: '40'},
    :red     => {fg: '31', bg: '41'},
    :green   => {fg: '32', bg: '42'},
    :yellow  => {fg: '33', bg: '43'},
    :blue    => {fg: '34', bg: '44'},
    :magenta => {fg: '35', bg: '45'},
    :cyan    => {fg: '36', bg: '46'},
    :white   => {fg: '37', bg: '47'},

    :bright_black   => {fg: '90', bg: '100'},
    :bright_red     => {fg: '91', bg: '101'},
    :bright_green   => {fg: '92', bg: '102'},
    :bright_yellow  => {fg: '93', bg: '103'},
    :bright_blue    => {fg: '94', bg: '104'},
    :bright_magenta => {fg: '95', bg: '105'},
    :bright_cyan    => {fg: '96', bg: '106'},
    :bright_white   => {fg: '97', bg: '107'}
  }

  def self.escape_code(code)
    "\u001b[#{code}m"
  end

  def self.command(command_sym)
    escape_code(COMMANDS[command_sym])
  end

  def self.effect(effect_sym)
    escape_code(EFFECTS[effect_sym])
  end

  # TODO(zmd): @Future: dispatch on type, and allow 256 and 24 bit colors
  def self.fg(color_sym)
    escape_code(COLORS[color_sym][:fg])
  end

  def self.bg(color_sym)
    escape_code(COLORS[color_sym][:bg])
  end

  module Simple
    def self.reset
      ANSI.command(:reset)
    end

    def self.bold(str)
      "#{ANSI.effect(:bold)}#{str}#{ANSI.effect(:un_bold)}"
    end

    def self.italic(str)
      "#{ANSI.effect(:italic)}#{str}#{ANSI.effect(:un_italic)}"
    end

    def self.underline(str)
      "#{ANSI.effect(:underline)}#{str}#{ANSI.effect(:un_underline)}"
    end

    def self.blink(str)
      "#{ANSI.effect(:blink)}#{str}#{ANSI.effect(:un_blink)}"
    end

    def self.reverse(str)
      "#{ANSI.effect(:reverse)}#{str}#{ANSI.effect(:un_reverse)}"
    end

    def self.color(color_sym, str)
      "#{ANSI.fg(color_sym)}#{str}#{ANSI.fg(:default)}"
    end

    def self.black(str)
      color :black, str
    end

    def self.bright_black(str)
      color :bright_black, str
    end

    def self.red(str)
      color :red, str
    end

    def self.bright_red(str)
      color :bright_red, str
    end

    def self.green(str)
      color :green, str
    end

    def self.bright_green(str)
      color :bright_green, str
    end

    def self.yellow(str)
      color :yellow, str
    end

    def self.bright_yellow(str)
      color :bright_yellow, str
    end

    def self.blue(str)
      color :blue, str
    end

    def self.bright_blue(str)
      color :bright_blue, str
    end

    def self.magenta(str)
      color :magenta, str
    end

    def self.bright_magenta(str)
      color :bright_magenta, str
    end

    def self.cyan(str)
      color :cyan, str
    end

    def self.bright_cyan(str)
      color :bright_cyan, str
    end

    def self.white(str)
      color :white, str
    end

    def self.bright_white(str)
      color :bright_white, str
    end

  end

end

