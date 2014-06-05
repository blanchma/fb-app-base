module UserService
  def self.access(auth)
    user = User.where(:uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    token = auth['credentials']['token']
    user.update_attribute(:token, token) if user.token != token && !user.long_lived_token?
    user
  end
end
