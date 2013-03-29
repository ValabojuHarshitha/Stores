class CustomerStore < ActiveRecord::Base
  attr_accessible :customer_id, :store_id
  scope :count_store_list , lambda { |user|
    where("customer_id = ?", user.id)
    #find(user.location_id)
  }
end
