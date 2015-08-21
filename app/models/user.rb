class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.screen_name = auth["info"]["nickname"]
      user.image_url = auth["info"]["image"]
      user.access_token = auth["credentials"]["token"]
      user.secret_access_token = auth["credentials"]["secret"]
    end
  end

  def account_completed?
    true if team_domain.present?
  end

end
