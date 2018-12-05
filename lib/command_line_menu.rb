def menu_options
  input = gets.chomp

  if input == "1" || input == "search by athlete" || input == "athlete"
    get_athlete_from_user
  elsif input == "2" || input == "search by event" || input == "event"
    get_event_from_user
  elsif input == "3" || input == "search by injuries" || input == "injuries"
    get_injuries
  elsif input == "4" || input == "see all data" || input == "all"
    get_all_info_menu
  elsif input == "5" || input == "export all data to text file" || input == "export"
    export_data_to_txt_file
  elsif input == "6" || input == "search by date" || input == "date"
    get_info_by_date
  elsif input == "7" || input == "exit"
    puts "goodbye"
    exit
  end
end

def get_all_info_menu_options
  input = gets.chomp

  if input == "1" || input == "see all athletes" || input == "athlete"
    get_athlete_info
  elsif input == "2" || input == "see all events" || input == "event"
    get_event_info
  elsif input == "3" || input == "see all injuries" || input == "injuries"
    get_injuries_info
  elsif input == "4" || input == "see all data" || input == "all"
    get_all_info
  elsif input == "5" || input == "main menu" || input == "menu"
    system("clear")
    welcome
  end
end

# ------> Information <------
def get_athlete_from_user
  puts "please enter an athlete's name:"
  # use gets to capture the user's input. This method should return that input, downcased.
  athlete_name = gets.chomp.downcase
  Athlete.get_injuries(athlete_name)
  welcome
end

def get_event_from_user
  puts "please enter an event's name:"
  # use gets to capture the user's input. This method should return that input, downcased.
  event_name = gets.chomp.downcase
  Event.get_injuries(event_name)
  welcome
end

def get_injuries
  puts "please enter an injury:"
  injury_name = gets.chomp.downcase
  Injury.get_info(injury_name)
  welcome
end

def get_info_by_date
  puts "please enter a date in YYYY-MM-DD format:"
  date = gets.chomp.downcase
  Injury.search_by_date(date)
  welcome
end

def export_data_to_txt_file
  puts ""
  Injury.export_data_to_txt_file
  # Dir.glob("a_directory/*/").max_by {|f| File.mtime(f)}
  welcome
end
# ------> Information End <------

# ------> All Data Lists <------
def get_all_info
  clear_f
  Injury.return_all_info
  get_info_menu
end

def get_athlete_info
  Athlete.get_player_names
  input = search
  if input == "y"
    clear_f
    Athlete.get_player_names
    get_athlete_from_user
  else
    clear_f
    Athlete.get_player_names
    get_info_menu
  end
end

def get_event_info
  Event.get_event_names
  input = search
  if input == "y"
    clear_f
    Event.get_event_names
    get_event_from_user
  else
    clear_f
    Event.get_event_names
    get_info_menu
  end
end

def get_injuries_info
  Injury.only_injury_info
  input = search
  if input == "y"
    clear_f
    Injury.only_injury_info
    get_injuries
  else
    clear_f
    Injury.only_injury_info
    get_info_menu
  end
end

def get_date_info
  Event.get_date
  input = search
  if input == "y"
    clear_f
      Event.get_date
    get_info_by_date
  else
    clear_f
      Event.get_date
    get_info_menu
  end
end
#------>End All Data Lists <------

#------>Helper Methods<------
def clear_f
  system("clear")
  puts ""
end

def get_info_menu
  puts ""
  get_all_info_menu
end

#------>Helper Methods End<------


def search
  puts "Would you like to search current list?(Y / N)"
  input = gets.chomp.downcase
end
#------>Helper Mehtods End<------