class User < ActiveRecord::Base
  has_many :events, :source => :creator
end
