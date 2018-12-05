class Injury < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :event

  def self.get_info(injury_name)
    puts "" #here for formatting
    Injury.all.find do |injury|
      if injury.name.downcase == injury_name
        system("clear")
        puts "*#{injury.name}"
        puts "     athlete: #{injury.athlete.name}"
        puts "          event: #{injury.event.name}"
        puts "               date of injury: #{injury.event.date_occurred}"
      end
    end
  end

  def self.only_injury_info
    sorted = self.all.sort_by { |injury| injury.name }
    sorted.each {|injury| puts "* #{injury.name}"}
  end

  def self.return_all_info
    sorted = self.all.sort_by { |injury| injury.athlete.name }
    sorted.each do |injury|
      puts "* #{injury.athlete.name}"
      puts "     injury: #{injury.name}"
      puts "          event: #{injury.event.name}"
      puts "               date of injury: #{injury.event.date_occurred}"
    end
  end

  def self.export_data_to_txt_file
    date = DateTime.now
    injury_data = self.return_all_info
    injury_strings = []

    injury_data.each do |injury|
      athlete_name = injury.athlete.name
      injury_name = injury.name
      event_name = injury.event.name
      event_date = injury.event.date_occurred

      # string = "#{athlete_name} suffered #{injury_name} at #{event_name} on #{event_date}"
      string = <<~HEREDOC
      *#{athlete_name}
           injury: #{injury_name}
                event: #{event_name}
                     date of injury: #{event_date}
      HEREDOC
      injury_strings << string

    end

    File.open("#{date}", "w") { |datafile| datafile.puts injury_strings }
  end

  def self.search_by_date(date)
    puts ""
    Injury.all.each do |injury|
      if injury.event.date_occurred == date
        puts "*#{injury.event.date_occurred}"
        puts "     injury: #{injury.name}"
        puts "          event: #{injury.event.name}"
        puts "               athlete: #{injury.athlete.name}"
      end
    end
  end
  # binding.pry
end #end of Injury class
