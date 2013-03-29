# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create([{:role_name=> 'Admin' },{:role_name=> 'Customer' },{:role_name=> 'Vendor' }])
Location.create([{:city_id=>3493,:location_name=>'gandhinagar'},{:city_id=>3493,:location_name=>'ameerpet'},{:city_id=>3493,:location_name=>'koti'},{:city_id=>3493,:location_name=>'mehdipatnam'},{:city_id=>3493,:location_name=>'dilsukhnagar'},{:city_id=>3493,:location_name=>'himayathnagar'},{:city_id=>3493,:location_name=>'hitechcity'}])