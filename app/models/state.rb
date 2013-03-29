class State < ActiveRecord::Base
  attr_accessible :country_id, :state_name
  belongs_to :country
  has_many :cities
end
