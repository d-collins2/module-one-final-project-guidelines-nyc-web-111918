class Athlete < ActiveRecord::Base
  has_many :injuries
  has_many :events, through: :injuries

  def self.get_injuries(athlete_name)
    puts ""
    self.all.find do |athlete|
      if athlete.name.downcase == athlete_name
        athlete.injuries.each do |injury|
          puts <<~HEREDOC
          * #{injury.athlete.name}
               injury: #{injury.name}
                    event: #{injury.event.name}
                         date of injury: #{injury.event.date_occurred}
          HEREDOC
        end
      end
    end
  end

  def self.get_player_names
    # binding.pry
    self.all_athletes.each { |athlete| puts "* #{athlete}" }
  end

  def self.all_athletes
    sorted = self.all.sort_by { |athlete| athlete.name.downcase }
    sorted.map { |athlete| athlete.name.downcase }.uniq
  end
end #end of Athlete class
