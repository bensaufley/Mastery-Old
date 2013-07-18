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
    where(till: nil).order("`when` DESC").first
  end
  
  def self.time_spent
    @time = 0
    all.each do |i|
      @time += (i.till - i.when) unless i.till.nil?
    end
    where(till: nil).each do |i|
      @time += (Time.now - i.when)
    end
    @time
  end
  
  protected
    
    def set_till
      self.till = Time.now if till_now
    end
    
    def check_for_running
      
    end
end
