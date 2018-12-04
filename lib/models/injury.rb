class Injury < ActiveRecord::Base
  belongs_to :athletes
  belongs_to :events

end #end of Injury class
