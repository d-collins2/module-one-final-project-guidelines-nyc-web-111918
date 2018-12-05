class Athlete < ActiveRecord::Base
  has_many :injuries
  has_many :events, through: :injuries

  def self.get_injuries(athlete_name)
    puts ""
    self.all.find do |athlete|

      # binding.pry
      if athlete.name.downcase == athlete_name
        athlete.injuries.each do |injury|
          # binding.pry
          puts <<~HEREDOC
          * #{injury.athlete.name}
               injury:#{injury.name}
                    event: #{injury.event.name}
                         date of injury: #{injury.event.date_occurred}
          HEREDOC
        end
      end
    end
  end

  def self.get_player_names
    sorted = self.all.sort_by{|event| event.name}
    sorted.each { |player| puts "* #{player.name}" }
  end

end #end of Athlete class
