# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
FbApp::Application.config.secret_key_base = 'c78ab18ce0fc6a5012686a475bb33b5c95b30df77b07bbc028fcb132d1a8ef70a13a476dadef62ee876aafd34a1c4546767ddfa6b5706777db506d48f94c4761'

FbApp::Application.config.action_dispatch.default_headers = {
  'X-Frame-Options' => 'GOFORIT',
  'X-XSS-Protection' => '1; mode=block',
  'X-Content-Type-Options' => 'nosniff'
}
