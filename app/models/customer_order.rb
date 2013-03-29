class CustomerOrder < ActiveRecord::Base
  attr_accessible :order_number, :payment_approved, :payment_completed, :payment_type, :total_price
end
