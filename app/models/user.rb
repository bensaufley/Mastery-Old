class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activities
  has_many :instances, through: :activities
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }

  def to_param
    username
  end
end