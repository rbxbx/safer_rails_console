require 'safer_rails_console/prompt'

Pry.config.prompt = Pry::Prompt::MAP["rails"][:value]

Pry.start

exit
