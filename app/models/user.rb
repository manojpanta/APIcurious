class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    user = where(uid: auth_info[:uid]).first_or_create  do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.user_name          = auth_info.extra.raw_info.login
      new_user.oauth_token        = auth_info.credentials.token
      new_user.avatar_url         = auth_info.extra.raw_info.avatar_url
    end
    user.update(avatar_url:   auth_info.extra.raw_info.avatar_url,
                oauth_token:  auth_info.credentials.token,
                user_name:    auth_info.extra.raw_info.login,
                name:         auth_info.extra.raw_info.name)
    user
  end
end
