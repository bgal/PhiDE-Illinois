# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
scott = User.new(:email => "meris608@gmail.com", :password => "scottrice")
scott.name = "Scott Rice"
scott.access_code = "x23phi"
scott.admin = true
scott.save
brian = User.new(:email => "gallagh7@illinois.edu", :password => "shitdick")
brian.name = "Brian Gallagher"
brian.access_code = "x23phi"
brian.admin = true
brian.save