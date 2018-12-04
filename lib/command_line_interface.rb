# require_all '../models/'

def welcome
  puts "Welcome!"
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
  elsif input == "5" || input == "exit"
    puts "Goodbye!"
    exit
  end
end

def menu
  puts "MAIN MENU"
  puts "Please enter your option"
  array_of_options = ["Search by Athlete", "Search by Events", "Search by Injuries", "See all Data", "exit"]
  array_of_options.each_with_index do |option, index|
    puts "[#{index + 1}] #{option}"
  end
end

def get_athlete_from_user
  system("clear")
  puts "please enter an athlete's name"
  # use gets to capture the user's input. This method should return that input, downcased.
  athlete_name = gets.chomp.downcase
  Athlete.get_injuries(athlete_name)
  welcome
end

def get_event_from_user
  system("clear")
  puts "please enter an event's name"
  # use gets to capture the user's input. This method should return that input, downcased.
  event_name = gets.chomp.downcase
  Event.get_injuries(event_name)
  welcome
end

def get_injuries
  system("clear")
  puts "please enter an injury"

  injury_name = gets.chomp.downcase
  Injury.get_info(injury_name)
  welcome
end

def get_all_info
  system("clear")
  Injury.return_all_info
  welcome
end
