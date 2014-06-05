class AppNotification

  def initialize
    app_token = MiniFB.authenticate_as_app ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
    @app_token = app_token["access_token"]
  end

  def notify(to_uid, message, href=nil, ref=nil)
    MiniFB.post @app_token, to_uid, type: "notifications", params: {
      template: message,
      href: href,
      ref: ref}
  end

end
