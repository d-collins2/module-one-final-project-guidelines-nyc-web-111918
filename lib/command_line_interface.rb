require_relative "command_line_menu"

def welcome
  puts ""
  puts "welcome to the ______ program"
  main_menu
  menu_options
end


def main_menu
  puts "            MAIN MENU"
  puts "     please choose an option"
  options = ["search by athlete", "search by event", "search by injury", "see all data", "exit"]
  array_of_options(options)
end

def get_all_info_menu
  puts ""
  puts "        please choose an option"
  options = ["athlete information", "event information", "injury information", "see all data", "main menu"]
  array_of_options(options)
  get_all_info_menu_options
  system("clear")
end

def array_of_options(options)
  options.each_with_index do |option, index|
    puts "[#{index + 1}]....................#{option}"
  end
end
