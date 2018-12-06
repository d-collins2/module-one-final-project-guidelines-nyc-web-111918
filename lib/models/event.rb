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
    sorted = self.all.sort_by{|event| event.name }
    sorted_events = sorted.map { |event| event.name }.uniq
    sorted_events.each { |event_name| puts "* #{event_name}" }
  end

  def self.get_date
    sorted = self.all.sort_by{|event| event.date_occurred }
    sorted_dates = sorted.map { |event| event.date_occurred }.uniq.reverse
    sorted_dates.each { |date| puts "* #{date}" }
  end

end #end of Event class
