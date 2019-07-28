class ApplicationController < ActionController::Base
  rescue_from ActionPolicy::Unauthorized, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "Ci spiace: non hai le autorizzazioni necessarie"
    redirect_to(request.referrer || root_path)
  end
end
