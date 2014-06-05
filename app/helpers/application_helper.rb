module ApplicationHelper

  def page_metadata
    out = {}
    session_key      = Rails.application.config.session_options[:key]
    out['session']   = cookies[session_key]
    out['csrfParam'] = Rack::Utils.escape_html(request_forgery_protection_token)
    out['csrfToken'] = Rack::Utils.escape_html(form_authenticity_token)
    #out['appUrl']    = $fb_url
    out
  end

  def safari_redirect
    url = url_for(controller: params[:controller], action: params[:action])
    "#{ENV['HOST']}/redirected?redirect_to=#{url}"
  end

  def facebook_iframed_url
    "#{ENV['FACEBOOK_CANVAS']}#{request.path}"
  end

end
