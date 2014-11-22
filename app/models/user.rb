class User < ActiveRecord::Base
  has_many :events, :source => :creator


  has_many :event_users
 # has_many :attended_events, :through => :event_users#, :source => :attended_event
  #comment the next two lines and uncomment the rest for the first solution
  has_many :upcoming_events, -> { where("date > ?", Time.now) }, :through => :event_users, :source => :attended_event
  has_many :previous_events, -> { where("date <= ?", Time.now) }, :through => :event_users, :source => :attended_event

#  def upcoming_events
#    self.attended_events.where("date > ?", Time.now)
#  end

#  def previous_events
#    self.attended_events.where("date <= ?", Time.now)
#  end
end
