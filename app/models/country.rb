class Country < ActiveRecord::Base
 attr_accessible :country_call_code, :country_code, :country_name
 has_many :states
 has_many :cities, :through => :states
end
