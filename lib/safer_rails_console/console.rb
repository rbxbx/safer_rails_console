module SaferRailsConsole
  module Console
    class << self
      include SaferRailsConsole::Colors

      def initialize_sandbox
        require 'safer_rails_console/patches/sandbox'
      end

      def print_warning
        puts color_text(SaferRailsConsole.config.warn_text, SaferRailsConsole.prompt_color) # rubocop:disable Rails/Output
      end

      def load_config
        root = $LOAD_PATH.grep(/safer_rails_console/).first
        ARGV.push '-r', File.join(root, 'lib', 'safer_rails_console', 'consoles', "#{SaferRailsConsole.config.console}.rb")
      end

      def sandbox_user_prompt
        puts "Defaulting the console into sandbox mode.\nType 'disable' to disable. Anything else will begin a sandboxed session:" # rubocop:disable Rails/Output
        input = gets.strip
        input != 'disable'
      end
    end
  end
end
