# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de

  config.after_initialize do
    # monkey patch to get full error message into hoptoad
    # http://help.hoptoadapp.com/discussions/problems/247-error-message-length-limit
    module HoptoadNotifier
      MAX_ERROR_MESSAGE_LENGTH = 255

      module Catcher

        private

        # Hoptoad truncates our error message at 255 characters, but preserves full strings within
        # the environment hash.  To preserve our entire error message, we'll stuck it in the
        # environment hash here if it's too long.
        def send_to_hoptoad_with_full_error_message(data)
          if data[:notice] && data[:notice][:error_message].to_s.size > MAX_ERROR_MESSAGE_LENGTH
            data = data.dup # modify a dup rather than the original to prevent unintended side effects.
            (data[:notice][:environment] ||= {})[:full_error_message] = data[:notice][:error_message]
            data[:notice][:error_message] = data[:notice][:error_message][0, MAX_ERROR_MESSAGE_LENGTH]
          end
          send_to_hoptoad_without_full_error_message(data)
        end
        alias_method_chain :send_to_hoptoad, :full_error_message
      end
    end
  end
end