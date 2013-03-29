class Category < ActiveRecord::Base
  attr_accessible :category_name, :category_type_id, :parent_id
end
