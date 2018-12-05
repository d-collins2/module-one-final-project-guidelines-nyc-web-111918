class Athlete < ActiveRecord::Base
  has_many :injuries
  has_many :events, through: :injuries

  def self.get_injuries(athlete_name)
    self.all.find do |athlete|
      if athlete.name.downcase == athlete_name
        athlete.injuries.each do |injury|
          system("clear")
          puts ""
          puts injury.name.camelcase
        end
      end
    end
  end

  def self.get_player_names
    sorted = self.all.sort_by{|event| event.name.downcase}
    sorted.each { |player| puts "* #{player.name}" }
  end

end #end of Athlete class
