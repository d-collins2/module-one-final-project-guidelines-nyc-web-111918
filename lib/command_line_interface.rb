require_relative "command_line_menu"

def welcome
  puts ""
  a = Artii::Base.new :font => 'slant'
  puts a.asciify('WELCOME!')
  main_menu
end

def main_menu
  puts "            MAIN MENU"
  puts "     please choose an option"
  options = ["search by athlete", "search by event", "search by injury", "search by date", "see all data", "export all data to text file", "exit"]
  array_of_options(options)
  menu_options
  system("clear")
end

def get_all_info_menu
  puts ""
  puts "        which data would you like to see?"
  options = ["see all athletes", "see all events", "see all injuries", "date information", "see all data", "main menu"]
  array_of_options(options)
  get_all_info_menu_options
  system("clear")
end

def array_of_options(options)
  options.each_with_index do |option, index|
    puts "[#{index + 1}]....................#{option}"
  end
end

def menu_options
  input = gets.chomp
  clear_f
  if input == "1" || input == "search by athlete" || input == "athlete"
    get_athlete_from_user
  elsif input == "2" || input == "search by event" || input == "event"
    get_event_from_user
  elsif input == "3" || input == "search by injuries" || input == "injuries"
    get_injuries
  elsif input == "4" || input == "search by date" || input == "date"
    get_info_by_date
  elsif input == "5" || input == "see all data" || input == "all"
    get_all_info_menu
  elsif input == "6" || input == "export all data to text file" || input == "export"
    export_data_to_txt_file
  elsif input == "7" || input == "exit"
    puts "goodbye"
    exit
  else
    welcome
  end
end

def get_all_info_menu_options
  input = gets.chomp
  clear_f
  if input == "1" || input == "athlete information" || input == "athlete"
    clear_f
    get_athlete_info
  elsif input == "2" || input == "event information" || input == "event"
    clear_f
    get_event_info
  elsif input == "3" || input == "injury information" || input == "injuries"
    clear_f
    get_injuries_info
  elsif input == "4" || input == "date information" || input == "all"
    clear_f
    get_date_info
  elsif input == "5" || input == "see all data" || input == "all"
    clear_f
    get_all_info
  elsif input == "6" || input == "main menu" || input == "menu"
    system("clear")
    welcome
  else
    get_all_info_menu
  end
end
