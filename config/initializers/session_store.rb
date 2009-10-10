# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wafamilyhistory_session',
  :secret      => 'e8233c00e36c50cfbbc1ff14806aadb7dea210755428661a3a3d6591a2c04f22f878781af9d8471503b3b4acb2ddd5b7a676a05b5ef20fc556afb62c3327d3f9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
