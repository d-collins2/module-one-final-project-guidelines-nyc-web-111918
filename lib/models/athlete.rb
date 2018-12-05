class Athlete < ActiveRecord::Base
  has_many :injuries
  has_many :events, through: :injuries

  def self.get_injuries(athlete_name)
    self.all.find do |athlete|
      if athlete.name.downcase == athlete_name
        athlete.injuries.each do |injury|
          system("clear")
          puts ""
          puts "*#{injury.athlete.name}"
          puts "     #{injury.name.camelcase}"
          puts "          event: #{injury.event.name}"
          puts "               date of injury: #{injury.event.date_occurred}"
        end
      end
    end
  end

  def self.get_player_names
    sorted = self.all.sort_by{|event| event.name}
    sorted.each { |player| puts "* #{player.name}" }
  end

end #end of Athlete class
