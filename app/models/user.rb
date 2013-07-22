class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activities
  has_many :instances, through: :activities
  
  before_save :username_downcase
  
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def to_param
    username
  end
  
  def self.find_for_authentication(conditions)
    conditions[:username].downcase!
    super(conditions)
  end
  
  private
  def username_downcase
    self.username.downcase! if self.username
  end
end