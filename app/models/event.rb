class Event < ActiveRecord::Base
  belongs_to :creator, :foreign_key => :user_id, :class_name => "User"
  has_many :event_users
  has_many :attendees, :through => :event_users#, :source => :attendee
 #comment the next two lines and uncomment the rest for the first solution
  scope :future_events, -> { where("date > ?", Time.now) }
  scope :past_events, -> { where("date <= ?", Time.now) }

#  def self.future_events
#    Event.all.where("date > ?", Time.now)
#  end

#  def self.past_events
#    Event.all.where("date <= ?", Time.now)
#  end

end
