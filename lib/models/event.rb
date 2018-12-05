class Event < ActiveRecord::Base
  has_many :injuries
  has_many :athletes, through: :injuries

  def self.get_injuries(event_name)
    puts "" #placed here for formatting
    Event.all.each do |event|
      if event.name.downcase == event_name
        event.injuries.each do |injury|
          system("clear")
          puts ""
          puts injury.name.camelcase
          puts "     occurred at #{injury.event.name}"
          puts "          on #{injury.event.date_occurred}"
          puts "               sustained by #{injury.athlete.name}"
        end
      end
    end
  end

  def self.get_event_names
    sorted = self.all.sort_by{|event| event.name.downcase}
    sorted.each { |event| puts "* #{event.name}" }
  end

  def self.get_date
    sorted = self.all.sort_by{|event| event.date_occurred}.reverse
    sorted.each { |event| puts "* #{event.date_occurred}" }
  end
end #end of Event class
