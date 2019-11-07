app_name = if SaferRailsConsole::RailsVersion.six_or_above?
             ::Rails.application.class.module_parent.to_s.underscore.dasherize
           else
             ::Rails.application.class.parent.to_s.underscore.dasherize
           end
env_name = SaferRailsConsole.environment_name
status = ::Rails.application.sandbox ? 'read-only' : 'writable'

prompt = PryRails::RAILS_PROMPT if defined?(PryRails::RAILS_PROMPT)

prompt_name = "#{app_name}(#{env_name})(#{status}):%03n:%i"

if prompt
  Pry.config.prompt = prompt
else
  Pry.config.prompt_name = prompt_name
end
