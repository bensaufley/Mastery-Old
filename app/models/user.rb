class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :authentications

  def self.from_omniauth(provider,uid,nickname)
    auth = Authentication.find_or_initialize_by(provider: provider, uid: uid)
    if auth.user.nil?
      auth.user = User.create(username: nickname)
    end
    user = auth.user
    return user
  end

end