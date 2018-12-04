# require_all '../models/'

def welcome
  puts "Welcome!"
  puts "Do you want to search for injuries of athletes, or events?"
  input = gets.chomp

  if input == "athletes"
    get_athlete_from_user
  elsif input == "events"
    get_event_from_user
  end
end

def get_athlete_from_user
  puts "please enter an athlete's name"
  # use gets to capture the user's input. This method should return that input, downcased.
  athlete_name = gets.chomp.downcase
  Athlete.get_injuries(athlete_name)
end

def get_event_from_user
  puts "please enter an event's name"
  # use gets to capture the user's input. This method should return that input, downcased.
  event_name = gets.chomp.downcase
  Event.get_injuries(event_name)
end
