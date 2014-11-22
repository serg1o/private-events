class User < ActiveRecord::Base
  has_many :events, :source => :creator
  has_many :event_users
  has_many :attended_events, :through => :event_users#, :source => :attended_event

  def upcoming_events
    self.attended_events.where("date > ?", Time.now)
  end

  def previous_events
    self.attended_events.where("date <= ?", Time.now)
  end
end
