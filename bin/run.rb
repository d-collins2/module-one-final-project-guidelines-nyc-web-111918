require_relative '../config/environment'
require_relative '../lib/api_communicator.rb'
require_relative "../lib/command_line_interface.rb"

# url = 'https://api.mysportsfeeds.com/v2.0/pull/nba/injuries.json'
url = {
  "lastUpdatedOn": "2018-08-28T14:54:03.026Z",
  "players": [
    {
      "firstName": "Chris",
      "lastName": "Boucher",
      "currentTeam": {
        "abbreviation": "GSW"
      },
      "currentInjury": {
        "description": "sprained left ankle",
        "playingProbability": "OUT"
      },
      "height": "6'10\"",
      "weight": 200,
      "birthDate": "1993-01-09",
      "age": 25,
      "birthCity": "Castries",
      "birthCountry": "Saint Lucia",
    },
    {
      "firstName": "Fake",
      "lastName": "Name",
      "currentTeam": {
        "abbreviation": "GSW"
      },
      "currentInjury": {
        "description": "broken pelvis",
        "playingProbability": "OUT"
      },
      "height": "6'2\"",
      "weight": 185,
      "birthDate": "1993-01-09",
      "age": 23,
      "birthCity": "New York",
      "birthCountry": "Mars",
    }
  ]
}
# player_information(url)
system("clear")
welcome

# event = get_athlete_from_user
# Event.get_injuries(event)

#make new method that takes in string and finds the object associated with it
# show_character_movies(character)

#Chris Boucher
#Andre Iguodala
puts "Goodbye!"
