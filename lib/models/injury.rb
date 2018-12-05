class Injury < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :event

  def self.get_info(injury_name)
    puts "" #here for formatting
    Injury.all.find do |injury|
      if injury.name.downcase == injury_name
        system("clear")
        puts "#{injury.name}"
        puts "     athlete afflicted: #{injury.athlete.name}"
        puts "          event occurred at: #{injury.event.name}"
        #REMEMBER TO FORMAT THIS
      end
    end
  end

  def self.only_injury_info
    sorted = self.all.sort_by {|injury| injury.name }
    sorted.each {|injury| puts "* #{injury.name}"}
  end

  def self.return_all_info
    sorted = self.all.sort_by {|injury| injury.athlete.name }
    sorted.each do |injury|
      puts "* #{injury.athlete.name}"
      puts "     injury: #{injury.name}"
      puts "          event sustained: #{injury.event.name}"
    end
  end
end #end of Injury class
