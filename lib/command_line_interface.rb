# require_all '../models/'

def welcome
  puts ""
  puts "welcome to the ______ program"
  main_menu
  input = gets.chomp

  if input == "1" || input == "search by athlete" || input == "athlete"
    get_athlete_from_user
  elsif input == "2" || input == "search by event" || input == "event"
    get_event_from_user
  elsif input == "3" || input == "search by injuries" || input == "injuries"
    get_injuries
  elsif input == "4" || input == "see all data" || input == "all"
    get_all_info_menu
  elsif input == "5" || input == "exit"
    puts "Goodbye!"
    exit
  end
end

def main_menu
  puts "            MAIN MENU"
  puts "     please choose an option"
  array_of_options = ["search by athlete", "search by event", "search by injury", "see all data", "exit"]
  array_of_options.each_with_index do |option, index|
    puts "[#{index + 1}]....................#{option}"
  end
end

def get_athlete_from_user
  system("clear")
  puts ""
  puts "please enter an athlete's name:"
  # use gets to capture the user's input. This method should return that input, downcased.
  athlete_name = gets.chomp.downcase
  Athlete.get_injuries(athlete_name)
  welcome
end

def get_event_from_user
  system("clear")
  puts ""
  puts "please enter an event's name:"
  # use gets to capture the user's input. This method should return that input, downcased.
  event_name = gets.chomp.downcase
  Event.get_injuries(event_name)
  welcome
end

def get_injuries
  system("clear")
  puts ""
  puts "please enter an injury:"
  injury_name = gets.chomp.downcase
  Injury.get_info(injury_name)
  welcome
end


#-------> See All Data Menu <-------
def get_all_info
  system("clear")
  puts ""
  Injury.return_all_info
  puts ""
  get_all_info_menu
end

def get_athlete_info
  system("clear")
  puts ""
  Athlete.get_player_names
  puts ""
end

def get_event_info
  system("clear")
  puts ""
  Event.get_event_names
  puts ""
end

def get_injuries_info
  system("clear")
  puts ""
  Injury.only_injury_info
  puts ""
end

def get_all_info_menu_options
  input = gets.chomp

  if input == "1" || input == "athlete information" || input == "athlete"
    get_athlete_info
    puts " "
    get_all_info_menu
  elsif input == "2" || input == "event information" || input == "event"
    get_event_info
    puts " "
    get_all_info_menu
  elsif input == "3" || input == "injury information" || input == "injuries"
    get_injuries_info
    puts " "
    get_all_info_menu
  elsif input == "4" || input == "see all data" || input == "all"
    get_all_info
    puts " "
    get_all_info_menu
  elsif input == "5" || input == "main menu" || input == "menu"
    system("clear")
    welcome
  end
end

def get_all_info_menu
  puts "     please choose an option"
  array_of_options = ["athlete information", "event information", "injury information", "see all data", "main menu"]
  array_of_options.each_with_index do |option, index|
    puts "[#{index + 1}]....................#{option}"
  end
  get_all_info_menu_options
  system("clear")
end
#------>End of Get All Data Menu <--------
