# require_all '../models/'

def welcome
  puts ""
  puts "welcome to the ______ program"
  menu
  input = gets.chomp

  if input == "1" || input == "search by athlete" || input == "athlete"
    get_athlete_from_user
  elsif input == "2" || input == "search by event" || input == "event"
    get_event_from_user
  elsif input == "3" || input == "search by injuries" || input == "injuries"
    get_injuries
  elsif input == "4" || input == "see all data" || input == "all"
    get_all_info
  elsif input == "5" || input == "export all data to text file" || input == "export"
    export_data_to_txt_file
  elsif input == "6" || input == "search by date" || input == "date"
    get_info_by_date
  elsif input == "7" || input == "exit"
    puts "goodbye"
    exit
  end
end

def menu
  puts "            MAIN MENU"
  puts "     please choose an option"
  array_of_options = ["search by athlete", "search by event", "search by injury", "see all data", "export all data to text file", "search by date", "exit"]
  array_of_options.each_with_index do |option, index|
    puts "[#{index + 1}]....................#{option}"
  end
end

def get_athlete_from_user
  # system("clear")
  puts ""
  puts "please enter an athlete's name:"
  # use gets to capture the user's input. This method should return that input, downcased.
  athlete_name = gets.chomp.downcase
  Athlete.get_injuries(athlete_name)
  welcome
end

def get_event_from_user
  # system("clear")
  puts ""
  puts "please enter an event's name:"
  # use gets to capture the user's input. This method should return that input, downcased.
  event_name = gets.chomp.downcase
  Event.get_injuries(event_name)
  welcome
end

def get_injuries
  # system("clear")
  puts ""
  puts "please enter an injury:"
  injury_name = gets.chomp.downcase
  Injury.get_info(injury_name)
  welcome
end

def get_all_info
  # system("clear")
  puts ""
  Injury.return_all_info
  welcome
end

def export_data_to_txt_file
  puts ""
  Injury.export_data_to_txt_file
  # Dir.glob("a_directory/*/").max_by {|f| File.mtime(f)}
  welcome
end

def get_info_by_date
  puts ""
  puts "please enter a date in YYYY-MM-DD format:"
  date = gets.chomp.downcase
  Injury.search_by_date(date)
  welcome
end
