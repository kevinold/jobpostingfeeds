# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jobpostingfeeds_session',
  :secret      => '88a8f250759db03dbbf450bca8d7ec1faf20c622845cf796f27f223f80509076baa5815f4e448250080997a225b8d6db8a76163d24dfb8e800a56bc11314e5b6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
