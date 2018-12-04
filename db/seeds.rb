require 'database_cleaner'
require_all './lib/'

DatabaseCleaner.clean_with(:truncation)

Athlete.destroy_all
Event.destroy_all
Injury.destroy_all

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
} #hash of the player_information

def create_athlete(url)
  some_variable = player_information(url)

  some_variable.each do |athlete, data|
    binding.pry
    athlete = Athlete.create(:name=>athlete, :team=>data[1])
    injury = Injury.create(:name=>data[0])
    event = Event.create(:name=>"Pro Basketball Game")

    athlete.injuries << injury
    event.injuries << injury
  end
end

create_athlete(url)

# athlete1 = Athlete.create(:name=>"athlete1", :team=>"team1")
# athlete2 = Athlete.create(:name=>"athlete2", :team=>"team2")
# athlete3 = Athlete.create(:name=>"athlete3", :team=>"team3")
#
# event1 = Event.create(:name=>"event1")
# event2 = Event.create(:name=>"event2")
#
# injury1 = Injury.create(:name=>"injury1")
# injury2 = Injury.create(:name=>"injury2")
# injury3 = Injury.create(:name=>"injury3")
# injury4 = Injury.create(:name=>"injury4")
#
# athlete1.injuries << injury1
# athlete1.injuries << injury3
# athlete2.injuries << injury2
# #
# event1.injuries << injury1
# event1.injuries << injury2
# event2.injuries << injury3

#recognizes that the injuries have been implanted
#must define the variable athlete1 = Athlete.all[0] in rake console
#athlete1.injuries works!

#take what full_name(url) returns
#turn it into data that can be seeded
