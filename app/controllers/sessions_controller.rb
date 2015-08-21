class SessionsController < ApplicationController

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    flash[:notice] = "Signed In"

    if user.account_completed?
      redirect_to user_path(user)
    else
      flash[:info] = "Looks like you are missing some information on your account. Please update."
      redirect_to edit_user_path(user)
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed Out"
    redirect_to root_url
  end

end