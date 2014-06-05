class ApplicationController < ActionController::Base
  rescue_from MiniFB::FaceBookError, with: :remove_token

  before_filter :notification_callback? #TODO: filter only root_path
  before_filter :allow_iframe
  after_filter  :allow_iframe

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  def remove_token(exception)
    logger.info "\n[MiniFB::Error] #{exception.message}"
    if exception.message.include?("Session does not match current stored session") || exception.message.include?("Invalid OAuth access token")
      if current_user
        current_user.update_attribute(:token, nil)
        redirect_to "/auth/facebook"
      end
    end
  end

  def safari_return
    cookies["redirected"]=true
    redirect_to "#{ENV['FACEBOOK_CANVAS']}#{params[:redirect_to]}"
  end

  private

    def notification_callback?
      if params["fb_source"] == "notification" &&
        params["app_request_type"] == "user_to_user" && params["signed_request"]
        envelope = Facebook::Request.parse_signed_request(params["signed_request"], 6300)
        mother_uid = envelope["user_id"]
        if mother = Mother.find_by_uid(mother_uid)
          logger.debug "Mother with #{mother_uid} found. Redirect"
          redirect_to "/auth/facebook?state=invitation"
        else
          logger.warn "Invited user #{mother_uid} doesn't exist"
        end
      end
    end

    def current_user
      @current_user||= begin
        if params["signed_request"]
          envelope ||= Facebook::Request.parse_signed_request(params["signed_request"], 6300)
          logger.info "\n Current User #{envelope["user_id"]} \n" if envelope["user_id"]
          User.find_by_uid envelope["user_id"]
        else
          User.find(session[:user_id]) if session[:user_id]
        end
      rescue Exception => e
        nil
      end
      @current_user
    end

    def user_signed_in?
      return true if current_user
    end

    def authenticate_user!
      if !current_user
        #redirect_to root_url, :alert => t("notices.need_sign_in")
        redirect_to "/auth/facebook"
      else
        redirect_to rankings_path, notice: t("notices.is_inactive") if !current_user.active
      end
    end

    def allow_iframe
      response.headers.except! 'X-Frame-Options'
    end

    def only_canvas
      head :not_found and return false unless params["signed_request"]
    end
end
