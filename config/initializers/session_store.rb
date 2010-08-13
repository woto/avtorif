# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_avtorif_session',
  :secret      => 'fbd36e545a00c189c5371591346591308676710f8780d6d641dd1c9fe3c4c7d72797a9158d98dc474214204609c427bb4fa0e5e15840a365b1ea166adb672d0c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
