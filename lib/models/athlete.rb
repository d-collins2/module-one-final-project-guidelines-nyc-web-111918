class Athlete < ActiveRecord::Base
  has_many :injuries
  has_many :events, through: :injuries
end #end of Athlete class
