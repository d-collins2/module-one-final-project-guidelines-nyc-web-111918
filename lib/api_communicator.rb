require 'rest-client'
require 'json'
require 'pry'
# require_all 'lib/models'

#-------> KEEP <--------
# def response_hash(url) #hash returned from the API
#   response_string = RestClient.get(url)
#   JSON.parse(response_string)
# end
#-------> KEEP <--------

def player_information(url)
  #makes full name of athlete using firstName, lastName
  #from athlete_hash
  players_hash = {}
  # players = response_hash(url)
  players = url
  players[:players].each do |player|
    full_name = "#{player[:firstName]} #{player[:lastName]}"
    players_hash[full_name] = []

    player[:currentInjury].each_with_index do |player_injury, index|
      players_hash[full_name] << []
      players_hash[full_name][index] << player[:currentInjury][index][:description]
      players_hash[full_name][index] << player[:currentInjury][index][:eventOccurred]
      players_hash[full_name][index] << player[:currentInjury][index][:dateOccurred]
    end
    # players_hash[full_name] << player[:currentTeam][:abbreviation]
  end
  players_hash

end #example returns
#=> {"Chris Boucher"=>["sprained left ankle", "GSW"],
 #"Andre Iguodala"=>["right leg contusion", "GSW"]}
