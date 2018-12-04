class Injury < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :event

  def self.get_info(injury_name)
    Injury.all.find do |injury|
      if injury.name.downcase == injury_name
        system("clear")
        puts "#{injury.name} Belongs to #{injury.athlete.name} Happened at #{injury.event.name}"
        #REMEMBER TO FORMAT THIS
      end
    end
  end

  def self.return_all_info
    Injury.all.each do |injury|
      puts "#{injury.athlete.name}"
      puts "#{injury.name}"
      puts "#{injury.event.name}"
    end
  end
end #end of Injury class
