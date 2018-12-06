# ------> Information <------
def get_athlete_from_user
  puts "please enter an athlete's name"
  puts "or type 'exit' to return to main menu:"
  athlete = gets.chomp.downcase
  athletes = Athlete.all_athletes

  if athletes.include?(athlete)
    Athlete.get_injuries(athlete)
    back_to_welcome_screen
  elsif athlete == "exit"
    welcome
  else
    puts "invalid entry, or athlete does not exist in database"
    get_athlete_from_user
  end
end

def get_event_from_user
  puts "please enter an event"
  puts "or type 'exit' to return to main menu:"
  event = gets.chomp.downcase
  events = Event.all_events

  if events.include?(event)
    Event.get_injuries(event)
    back_to_welcome_screen
  elsif event == "exit"
    welcome
  else
    puts "invalid entry, or event does not exist in database"
    get_event_from_user
  end
end

def get_injuries
  puts "please enter an injury"
  puts "or type 'exit' to return to main menu:"
  injury = gets.chomp.downcase

  injurys = Injury.all_injuries
  if injurys.include?(injury)
    Injury.get_info(injury)
    back_to_welcome_screen
  elsif injury == "exit"
    welcome
  else
    puts "invalid entry, or injury does not exist in database"
    get_injuries
  end
end

def get_info_by_date
  puts "please enter a date in YYYY-MM-DD format"
  puts "or type 'exit' to return to main menu:"
  date = gets.chomp.downcase

  dates = Event.get_date_info #making array of dates
  if dates.include?(date)
    Injury.search_by_date(date)
    back_to_welcome_screen
  elsif date == "exit"
    welcome
  else
    puts "invalid entry, or date does not exist in database"
    get_info_by_date
  end
end

def export_data_to_txt_file
  puts ""
  Injury.export_data_to_txt_file
  # Dir.glob("a_directory/*/").max_by {|f| File.mtime(f)}
  back_to_welcome_screen
end
# ------> Information End <------

# ------> All Data Lists <------
def get_all_info #see all data
  clear_f
  Injury.return_all_info
  puts ""
  puts "press any key to return to the all information menu"
  STDIN.getch
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

#------>Creating New Entry <------
def get_user_input
  athlete_info = []
  puts "enter the athlete's name:"
    shovel_helper(athlete_info)
  puts "enter the athlete's injury:"
    shovel_helper(athlete_info)
  puts "enter the event associated with the injury:"
    shovel_helper(athlete_info)
  puts "enter the date the injury occurred:"
    shovel_helper(athlete_info)

  athlete_info
end

def create_new_entry
  Injury.return_all_info
  athlete_info = get_user_input
  athlete = Athlete.create(name: athlete_info[0])
  event = Event.create(name: athlete_info[2], date_occurred: athlete_info[3])
  Injury.create(name: athlete_info[1], athlete_id: athlete.id, event_id: event.id)
  back_to_welcome_screen
end

def delete_entry
  puts "enter the id of the entry you wish to delete:"
  user_input = gets.chomp
  injury = Injury.all.select { |injury| injury.athlete_id == user_input.to_i }
  until injury.empty?
    injury[0].event.delete
    injury[0].athlete.delete
    injury[0].delete
    injury.pop
  end
  back_to_welcome_screen
end

def update_athlete
  Injury.return_all_info_with_athlete_id
  puts "enter the id of the entry you wish to update:"
  user_input = gets.chomp
  puts "please enter your updated name:"
  updated_input = gets.chomp
  updated_entry = Athlete.update(user_input, :name => updated_input)
  puts updated_entry.name
  back_to_edit_menu
end

def update_injury
  Injury.return_all_info_with_injury_id
  puts "enter the id of the entry you wish to update:"
  user_input = gets.chomp
  puts "please enter your updated injury:"
  updated_input = gets.chomp
  updated_entry = Injury.update(user_input, :name => updated_input)
  puts updated_entry.name
  back_to_edit_menu
end

def update_event
  Injury.return_all_info_with_event_id
  puts "enter the id of the entry you wish to update:"
  user_input = gets.chomp
  puts "please enter your updated event:"
  updated_input = gets.chomp
  updated_entry = Event.update(user_input, :name => updated_input)
  puts updated_entry.name
  back_to_edit_menu
end

def update_date
  Injury.return_all_info_with_date_id
  puts "enter the id of the entry you wish to update:"
  user_input = gets.chomp
  puts "please enter your updated date:"
  updated_input = gets.chomp
  updated_entry = Event.update(user_input, :date_occurred => updated_input)
  puts updated_entry.date_occurred
  back_to_edit_menu
end
#------>End of Creating New Entry <------

#------>Helper Methods<------
def clear_f
  system("clear")
  puts ""
end

def get_info_menu
  puts ""
  get_all_info_menu
end

def shovel_helper(array)
  user_input = gets.chomp
  array << user_input
end

def search
  puts "Would you like to search current list?(Y / N)"
  input = gets.chomp.downcase
end

def back_to_welcome_screen
  puts ""
  puts "press any key to return to the main menu"
  STDIN.getch
  welcome
end

def back_to_edit_menu
  puts ""
  puts "press any key to return to the edit menu"
  STDIN.getch
  edit_entries_menu_gui
end
#------>Helper Mehtods End<------
