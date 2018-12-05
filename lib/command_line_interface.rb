require_relative "command_line_menu"

def welcome
  puts ""
  puts "welcome to the ______ program"
  main_menu
end


def main_menu
  puts "            MAIN MENU"
  puts "     please choose an option"
  options = ["search by athlete", "search by event", "search by injury", "see all data", "export all data to text file", "search by date", "exit"]
  array_of_options(options)
  menu_options
  system("clear")
end

def get_all_info_menu
  puts ""
  puts "        which data would you like to see?"
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

def export_data_to_txt_file
  puts ""
  Injury.export_data_to_txt_file
  # Dir.glob("a_directory/*/").max_by {|f| File.mtime(f)}
  welcome
end
