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
        "description": "sprained right nose",
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
      binding.pry
    end
    # injury = Injury.create(:name=>injuries[0])
    # event_instance = Event.create(:name=>injuries[1], :date_occurred=>injuries[2])
    # athlete_instance.injuries << injury
    # event_instance.injuries << injury
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
