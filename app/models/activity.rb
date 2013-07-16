class Activity < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, :name, :tracking_type, presence: true
  validates_associated :user
end
