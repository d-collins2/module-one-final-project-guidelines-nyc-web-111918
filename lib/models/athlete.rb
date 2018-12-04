class Athlete < ActiveRecord::Base
  has_many :injuries
  has_many :events, through: :injuries

  def self.get_injuries(athlete_name)
    Athlete.all.find do |athlete|
      if athlete.name.downcase == athlete_name
        athlete.injuries.each do |injury|
          system("clear")
          puts "~_~_~_~_~_~_~_~_~_~_~_~_~"
          puts injury.name.camelcase
          puts "~_~_~_~_~_~_~_~_~_~_~_~_~"
        end
      end
    end
  end

end #end of Athlete class
