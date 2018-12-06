class Injury < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :event

  def self.get_info(injury_name)
    puts ""
    Injury.all.find do |injury|
      if injury.name.downcase == injury_name
        puts <<~HEREDOC
        * #{injury.name}
             athlete: #{injury.athlete.name}
                  event: #{injury.event.name}
                       date of injury: #{injury.event.date_occurred}
        HEREDOC
      end
    end
  end

  def self.only_injury_info
    self.all_injuries.each { |injury_name| puts "* #{injury_name}" }
  end

  def self.all_injuries
    sorted = self.all.sort_by{ |injury| injury.name }
    sorted_injuries = sorted.map { |injury| injury.name }.uniq
  end

  def self.return_all_info
    sorted = self.all.sort_by { |injury| injury.athlete.name }
    sorted.each do |injury|
    puts <<~HEREDOC
      * #{injury.athlete.name} [id: #{injury.athlete.id}]
           injury: #{injury.name} [id: #{injury.id}]
                event: #{injury.event.name} [id: #{injury.event.id}]
                     date of injury: #{injury.event.date_occurred} [id: #{injury.event.id}]
      HEREDOC
    end
  end

  def self.return_all_info_with_athlete_id
    sorted = self.all.sort_by { |injury| injury.athlete.name }
    sorted.each do |injury|
    puts <<~HEREDOC
      * #{injury.athlete.name} [id: #{injury.athlete.id}]
           injury: #{injury.name}
                event: #{injury.event.name}
                     date of injury: #{injury.event.date_occurred}
      HEREDOC
    end
  end

  def self.return_all_info_with_injury_id
    sorted = self.all.sort_by { |injury| injury.athlete.name }
    sorted.each do |injury|
    puts <<~HEREDOC
      * #{injury.athlete.name}
           injury: #{injury.name} [id: #{injury.id}]
                event: #{injury.event.name}
                     date of injury: #{injury.event.date_occurred}
      HEREDOC
    end
  end

  def self.return_all_info_with_event_id
    sorted = self.all.sort_by { |injury| injury.athlete.name }
    sorted.each do |injury|
    puts <<~HEREDOC
      * #{injury.athlete.name}
           injury: #{injury.name}
                event: #{injury.event.name} [id: #{injury.event.id}]
                     date of injury: #{injury.event.date_occurred}
      HEREDOC
    end 
  end

  def self.return_all_info_with_date_id
    sorted = self.all.sort_by { |injury| injury.athlete.name }
    sorted.each do |injury|
    puts <<~HEREDOC
      * #{injury.athlete.name}
           injury: #{injury.name}
                event: #{injury.event.name}
                     date of injury: #{injury.event.date_occurred} [id: #{injury.event.id}]
      HEREDOC
    end
  end


  def self.export_data_to_txt_file
    date = DateTime.now
    injury_data = self.return_all_info
    injury_strings = []

    injury_data.each do |injury|
      string = <<~HEREDOC
      * #{injury.athlete.name}
           injury: #{injury.name}
                event: #{injury.event.name}
                     date of injury: #{injury.event.date_occurred}
      HEREDOC
      injury_strings << string
    end
    File.open("#{date}", "w") { |datafile| datafile.puts injury_strings }
  end

  def self.search_by_date(date)
    puts ""
    Injury.all.each do |injury|
      if injury.event.date_occurred == date
        puts <<~HEREDOC
        * #{injury.event.date_occurred}
             injury: #{injury.name}
                  event: #{injury.event.name}
                       athlete: #{injury.athlete.name}
        HEREDOC
      end
    end
  end
end #end of Injury class
