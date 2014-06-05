class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    redirect_to "/auth/facebook"
  end

  def create
    auth = request.env["omniauth.auth"]
    logger.info "\n Create session for: #{auth['uid']} #{auth['info']['name']} \n"
    if params["state"] == "invitation"
      user = MotherService.access(auth, true)
      redirect_to root_url(anchor: "login"), :notice => t("notices.not_invited") unless user
    else
      user = UserService.access(auth)
    end

    reset_session
    session[:user_id] = user.id

    if user.has_mother?
      redirect_to rankings_path(anchor: "login"), :notice => t("notices.sign_in")

    elsif !user.has_mother? && user.is_mother?
      redirect_to rankings_path(anchor: "login"), :notice => t("notices.sign_in")

    else
      redirect_to root_path(anchor: "login"), :notice => t("notices.sign_in")
    end
  end

  def destroy
    reset_session
    redirect_to root_url(anchor: 'logout'), :notice => t("notices.sign_out")
  end

  def deauthorize
    envelope = Facebook::Request.parse_signed_request(params["signed_request"], 6300)
    logger.info "[Sessions] Deauthorization #{envelope.inspect}"
    user = User.find_by_uid envelope["user_id"]
    head :not_found and return
    user.destroy
    logger.debug "[Sessions] Destroy user #{user.inspect}"
    head :ok
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
