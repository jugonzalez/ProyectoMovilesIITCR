class User < ActiveRecord::Base

has_many :articles

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider 
    user.uid      = auth.uid
    user.name     = auth.info.name
    has_many :articles
    user.save
  end
end

end
