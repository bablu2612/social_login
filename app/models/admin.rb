class Admin < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:google_oauth2,:facebook,:linkedin,:github,:twitter]
  has_one :profile
  def self.from_google(email:, full_name:, uid:, avatar_url:)
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end

  def self.from_twitter(twiterparams)
    create_with(uid: twiterparams[:uid], full_name: twiterparams[:full_name], avatar_url: twiterparams[:avatar_url]).find_or_create_by!(email: twiterparams[:email])
  end
end
