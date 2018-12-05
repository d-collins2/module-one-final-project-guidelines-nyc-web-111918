class Event < ActiveRecord::Base
  has_many :injuries
  has_many :athletes, through: :injuries

  def self.get_injuries(event_name)
    puts "" #placed here for formatting
    Event.all.each do |event|
      if event.name.downcase == event_name
        event.injuries.each do |injury|
          system("clear")
          # puts "~_~_~_~_~_~_~_~_~_~_~_~_~"
          puts injury.name.camelcase
          # puts "~_~_~_~_~_~_~_~_~_~_~_~_~"
        end
      end
    end
  end

  def self.get_event_names
    sorted = self.all.sort_by{|event| event.name}
    sorted.each { |event| puts "* #{event.name}" }
  end

end #end of Event class
