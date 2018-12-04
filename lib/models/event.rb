class Event < ActiveRecord::Base
  has_many :injuries
  has_many :athletes, through: :injuries

  def self.get_injuries(event_name)
    Event.all.each do |event|
      if event.name.downcase == event_name
        event.injuries.each do |injury|
          binding.pry
          puts injury.name.camelcase
        end
      end
    end
  end

end #end of Event class
