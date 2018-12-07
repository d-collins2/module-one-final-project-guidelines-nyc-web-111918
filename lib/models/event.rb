class Event < ActiveRecord::Base
  has_many :injuries
  has_many :athletes, through: :injuries

  def self.get_injuries(event_name)
    puts ""
    Event.all.each do |event|
      if event.name.downcase == event_name
        event.injuries.each do |injury|
          puts <<~HEREDOC.colorize(String.colors.sample)
          * #{injury.event.name}
               injuries: #{injury.name}
                    date: #{injury.event.date_occurred}
                         athlete: #{injury.athlete.name}
          HEREDOC
        end
      end
    end
  end

  def self.get_injuries_by_date(date)
    puts ""
    Event.all.each do |event|
      if event.date_occurred == date
        event.injuries.each do |injury|
          puts <<~HEREDOC.colorize(String.colors.sample)
          * #{injury.event.date_occurred}
               injuries: #{injury.name}
                    event: #{injury.event.name}
                         athlete: #{injury.athlete.name}
          HEREDOC

        end
      end
    end
  end

  def self.get_event_names
    self.all_events.each { |event_name| puts "* #{event_name}" }
  end

  def self.all_events
    sorted = self.all.sort_by { |event| event.name }
    sorted.map { |event| event.name.downcase }.uniq
  end

  def self.get_date
    self.get_date_info.each { |date| puts "* #{date}" }
  end

  def self.get_date_info
    sorted = self.all.sort_by { |event| event.date_occurred }
    dates = sorted.map { |event| event.date_occurred }.uniq
  end
end #end of Event class
