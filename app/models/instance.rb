class Instance < ActiveRecord::Base
  belongs_to :activity
  before_create :check_for_running
  before_update :set_till

  attr_accessor :till_now
  
  validates_associated :activity
  validates :when, presence: true
    
  def self.running?
    !all.empty? && order("`when` DESC").first.till.nil?
  end
  
  def self.running
    all.empty? ? nil : where(till: nil).order("`when` DESC").first
  end
  
  def self.time_spent
    @time = 0
    if !all.nil?
      all.each do |i|
        @time += (i.till - i.when) unless i.till.nil?
      end
      where(till: nil).each do |i|
        @time += (Time.now - i.when)
      end
    end
    @time
  end

  def self.times(range = 'all')
    case range
      when 'today'
        where('CONVERT(`when`,date) = :x', { x: Time.now.to_date })
      when 'in_last_week'
        where('`when` >= :x', { x: 1.week.ago })
      when 'in_last_month'
        where('`when` >= :x', { x: 1.week.ago })
      when 'in_last_year'
        where('`when` >= :x', { x: 1.week.ago })
      else
        all
    end
  end
    
  
  protected
    
    def set_till
      self.till = Time.now if till_now
    end
    
    def check_for_running
      if Instance.where(activity_id: activity_id).running?
        errors.add(:base, "already running")
      end
    end
end
