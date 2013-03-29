class Customer < ActiveRecord::Base
  attr_accessible :address, :city_id, :email, :first_name, :last_name, :location_id,:userid

end
