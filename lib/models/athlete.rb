class Athlete < ActiveRecord::Base
  has_many :injuries
  has_many :events, through: :injuries

  def self.get_injuries(athlete_name)
    Athlete.all.find do |athlete|
      if athlete.name.downcase == athlete_name
        athlete.injuries.each do |injury|
          puts injury.name.camelcase
        end
      end
    end
  end

end #end of Athlete class
