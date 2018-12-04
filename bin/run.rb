require_relative '../config/environment'
require_relative '../lib/api_communicator.rb'
require_relative "../lib/command_line_interface.rb"

# url = 'https://api.mysportsfeeds.com/v2.0/pull/nba/injuries.json'

url = {
  "lastUpdatedOn": "2018-08-28T14:54:03.026Z",
  "players": [
    {
      "id": 13766,
      "firstName": "Chris",
      "lastName": "Boucher",
      "primaryPosition": "PF",
      "jerseyNumber": 25,
      "currentTeam": {
        "id": 101,
        "abbreviation": "GSW"
      },
      "currentRosterStatus": "ROSTER",
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
      "rookie": false,
      "highSchool": "Damase Boulanger",
      "college": "University of Oregon",
      "handedness": {
        "shoots": nil
      },
      "officialImageSrc": nil,
      "socialMediaAccounts": [
        {
          "mediaType": "TWITTER",
          "value": "chrisboucher"
        }
      ]
    },
    {
      "id": 9223,
      "firstName": "Andre",
      "lastName": "Iguodala",
      "primaryPosition": "SF",
      "jerseyNumber": 9,
      "currentTeam": {
        "id": 101,
        "abbreviation": "GSW"
      },
      "currentRosterStatus": "ROSTER",
      "currentInjury": {
        "description": "right leg contusion",
        "playingProbability": "QUESTIONABLE"
      },
      "height": "6'6\"",
      "weight": 215,
      "birthDate": "1984-01-28",
      "age": 34,
      "birthCity": "Springfield, IL",
      "birthCountry": "USA",
      "rookie": false,
      "highSchool": "Lanphier",
      "college": "University of Arizona",
      "handedness": {
        "shoots": "R"
      },
      "officialImageSrc": nil,
      "socialMediaAccounts": [
        {
          "mediaType": "TWITTER",
          "value": "andre"
        }
      ]
    }
  ]
}
# player_information(url)
system("clear")
puts "---------------------------------------------"
welcome


# event = get_athlete_from_user
# Event.get_injuries(event)



#make new method that takes in string and finds the object associated with it
# show_character_movies(character)


#Chris Boucher
#Andre Iguodala
puts "Goodbye!"
