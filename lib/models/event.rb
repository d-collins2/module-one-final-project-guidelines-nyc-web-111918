class Event < ActiveRecord::Base
  has_many :injuries
  has_many :athletes, through: :injuries
end #end of Event class
