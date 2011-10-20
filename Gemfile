source :rubygems

gemspec

group :development do
  gem 'guard'

  # File modification detection libraries
  gem 'rb-inotify', :require => false # Linux
  gem 'rb-fsevent', :require => false # Mac OS X
  gem 'rb-fchange', :require => false # Windows

  # Notifications
  gem 'ruby_gntp' # Linux, Mac OS X, Windows
end

group :guard do
  gem 'rb-fsevent'
  gem 'guard-rspec'
end
