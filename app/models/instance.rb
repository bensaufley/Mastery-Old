class Instance < ActiveRecord::Base
  belongs_to :activity
  before_create :check_for_running
  before_update :set_time_until

  attr_accessor :till_now
  
  validates_associated :activity
  validates :time_when, presence: true
    
  def self.running?
    !all.empty? && order("time_when DESC").first.time_until.nil?
  end
  
  def self.running
    all.empty? ? nil : where(time_until: nil).order("time_when DESC").first
  end
  
  def self.recent
    all.order('time_when DESC').where('time_when >= :x', { x: 1.week.ago })
  end
  
  def time_spent
    time_until - time_when
  end
  
  def self.time_spent
    @time = 0
    if !all.nil?
      all.each do |i|
        @time += (i.time_until - i.time_when) unless i.time_until.nil?
      end
      where(time_until: nil).each do |i|
        @time += (Time.now - i.time_when)
      end
    end
    @time
  end

  def self.times(range = 'all')
    case range
      when 'today'
        where('time_when >= :x AND time_when < :y', { x: Time.now.to_date.to_time, y: (Time.now.to_date + 1.day).to_time })
      when 'in_last_week'
        where('time_when >= :x', { x: 1.week.ago })
      when 'in_last_month'
        where('time_when >= :x', { x: 1.week.ago })
      when 'in_last_year'
        where('time_when >= :x', { x: 1.week.ago })
      else
        all
    end
  end
    
  
  protected
    
    def set_time_until
      self.time_until = Time.now if till_now
    end
    
    def check_for_running
      if Instance.where(activity_id: activity_id).running?
        errors.add(:base, "already running")
      end
    end
end
