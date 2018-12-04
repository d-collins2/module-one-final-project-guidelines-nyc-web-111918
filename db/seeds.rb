require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

Athlete.destroy_all
Event.destroy_all
Injury.destroy_all

athlete1 = Athlete.create(:name=>"athlete1", :team=>"team1")
athlete2 = Athlete.create(:name=>"athlete2", :team=>"team2")
athlete3 = Athlete.create(:name=>"athlete3", :team=>"team3")

event1 = Event.create(:name=>"event1")
event2 = Event.create(:name=>"event2")

injury1 = Injury.create(:name=>"injury1")
injury2 = Injury.create(:name=>"injury2")
injury3 = Injury.create(:name=>"injury3")
injury4 = Injury.create(:name=>"injury4")

athlete1.injuries << injury1
athlete1.injuries << injury3
athlete2.injuries << injury2
#
event1.injuries << injury1
event1.injuries << injury2
event2.injuries << injury3

#recognizes that the injuries have been implanted
#must define the variable athlete1 = Athlete.all[0] in rake console
#athlete1.injuries works!
