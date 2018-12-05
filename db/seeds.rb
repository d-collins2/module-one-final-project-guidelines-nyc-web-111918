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
      "firstName": "Chris",
      "lastName": "Boucher",
      "currentTeam": {
        "abbreviation": "GSW"
      },
      "currentInjury":
      [
        {
        "description": "sprained left ankle",
        "eventOccurred": "GSW vs Lakers game",
        "dateOccurred": "2018-10-15"
        },
        {
        "description": "ruptured face",
        "eventOccurred": "GSW vs Lakers game",
        "dateOccurred": "2018-10-15"
        }
      ],
      "height": "6'10",
      "weight": 200,
      "birthDate": "1993-01-09",
      "age": 25,
      "birthCity": "Castries",
      "birthCountry": "Saint Lucia",
    },
    {
      "firstName": "Mr.",
      "lastName": "Basketball",
      "currentTeam": {
        "abbreviation": "Lakers"
      },
      "currentInjury":
      [
        {
        "description": "broken pelvis",
        "eventOccurred": "GSW vs Lakers game",
        "dateOccurred": "2018-10-15"
        },
        {
        "description": "ruptured face",
        "eventOccurred": "dinner at Applebee's",
        "dateOccurred": "2018-12-05"
        }
      ],
      "height": "6'2",
      "weight": 185,
      "birthDate": "1993-01-09",
      "age": 23,
      "birthCity": "New York",
      "birthCountry": "Mars",
    },
    {
      "firstName": "John",
      "lastName": "Martinez",
      "currentTeam": {
        "abbreviation": "Byakkokan Dojo"
      },
      "currentInjury":
      [
        {
        "description": "snapped pinky",
        "eventOccurred": "Longpoint 2019",
        "dateOccurred": "2019-02-13"
        }
      ],
      "height": "5'5",
      "weight": 140,
      "birthDate": "1987-09-17",
      "age": 31,
      "birthCity": "New Brunswick",
      "birthCountry": "USA",
    },
    {
      "firstName": "Dr.",
      "lastName": "Kill",
      "currentTeam": {
        "abbreviation": "Metro Hospital"
      },
      "currentInjury":
      [
        {
        "description": "cotton swab stuck in ear",
        "eventOccurred": "Cotton Swab Massacre of 1983",
        "dateOccurred": "1983-01-13"
        }
      ],
      "height": "4'11",
      "weight": 100,
      "birthDate": "1987-09-17",
      "age": 80,
      "birthCity": "Chicago",
      "birthCountry": "The Moon",
    }
  ]
}
 #hash of the player_information
def create_athlete(url)
  player_info_hash = player_information(url)

  player_info_hash.each do |athlete, injuries|
    athlete_instance = Athlete.create(:name=>athlete, :team=>injuries[3])

    injuries.map do |injury|
      event_instance = Event.create(:name=>injury[1], :date_occurred=>injury[2])
      injury_instance = Injury.create(:name=>injury[0])
      athlete_instance.injuries << injury_instance
      event_instance.injuries << injury_instance
    end
  end
end

create_athlete(url)
