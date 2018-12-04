class Injury < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :event

  def self.get_info(injury_name)
    Injury.all.find do |injury|
      if injury.name.downcase == injury_name
        system("clear")
        puts "---------------------------------------------"
        puts "#{injury.name.camelcase}"
        puts "Belongs to #{injury.athlete.name}"
        puts  "Happened at #{injury.event.name}"
        #REMEMBER TO FORMAT THIS
        puts "---------------------------------------------"
      end
    end
  end

  def self.return_all_info
    Injury.all.each do |injury|
      puts "---------------------------------------------"
      puts "#{injury.athlete.name}"
      puts "#{injury.name.camelcase}"
      puts "#{injury.event.name}"
    end
    puts "---------------------------------------------"
  end
end #end of Injury class
