class User < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.image            = auth.info.image
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def is_admin?
    if self.email == ENV['ADMIN_EMAIL']
      return true
    end
    false
  end

end
