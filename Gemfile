source :rubygems

gemspec

gem 'rake'

group :tools do
  gem 'guard-rspec'

  # File modification detection libraries
  gem 'rb-inotify', :require => false # Linux
  gem 'rb-fsevent', :require => false # Mac OS X
  gem 'rb-fchange', :require => false # Windows

  # Notifications
  gem 'ruby_gntp' # Linux, Mac OS X, Windows
  platforms :ruby do
    gem 'rb-readline'
  end
end
