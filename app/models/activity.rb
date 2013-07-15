class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :instances
  
  validates :user, associated: true
  validates :name, :private, :trackmethod, presence: true
end
