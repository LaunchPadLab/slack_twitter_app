class UsersController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    Rails.cache.write('access_token', auth["credentials"]["token"])
    Rails.cache.write('secret_access_token', auth["credentials"]["secret"])
    redirect_to root_path
  end
end
