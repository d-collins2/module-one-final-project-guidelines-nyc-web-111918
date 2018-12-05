class Event < ActiveRecord::Base
  has_many :injuries
  has_many :athletes, through: :injuries

  def self.get_injuries(event_name)
    puts ""
    Event.all.each do |event|
      if event.name.downcase == event_name
        event.injuries.each do |injury|
          puts <<~HEREDOC
          * #{injury.event.name}
               injuries: #{injury.name}
                    date: #{injury.event.date_occurred}
                         athlete: #{injury.athlete.name}
          HEREDOC
        end
      end
    end
  end

  def self.get_event_names
    sorted = self.all.sort_by{|event| event.name}

    sorted_events = sorted.map do |event|
      event.name
    end.uniq

    sorted_events.each { |event_name| puts "* #{event_name}" }
  end
end #end of Event class
