class Event < ActiveRecord::Base
  belongs_to :creator, :foreign_key => :user_id, :class_name => "User"
  has_many :event_users
  has_many :attendees, :through => :event_users#, :source => :attendee

  def self.future
    Event.all.where("date > ?", Time.now)
  end

  def self.past
    Event.all.where("date <= ?", Time.now)
  end
end
