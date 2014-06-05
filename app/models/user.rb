class User < ActiveRecord::Base

  validates_presence_of   :name, :uid
  validates_uniqueness_of :uid

  scope :expired_tokens, -> { where("token IS NOT NULL and token_expires_at IS NULL or token_expires_at < ?", Time.now) }

  def invitation_pending?
    invited == true && accepted == false
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.token = auth['credentials']['token']
      end
    end
  end

  def facebook
    return nil unless self.token
    @fb ||= MiniFB::OAuthSession.new(self.token)

    rescue MiniFB::FaceBookError => e
      logger.error "[User#facebook] #{e.message}"
      case e.message
      when /not authorized application/
        return nil
      when /Error validating access token/
        refresh_token!
        return facebook
      end
  end

  def long_lived_token?
    self.token && self.token_expires_at && self.token_expires_at > Time.now
  end

  def refresh_token!
     exchange = MiniFB.fb_exchange_token(ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], self.token)
     self.update_attribute(:token, exchange["access_token"])
     self.update_attribute(:token_expires_at, exchange["expires"].to_i.seconds.from_now)
  end

end
