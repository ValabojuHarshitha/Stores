class StoreCategory < ActiveRecord::Base
   attr_accessible :store_id, :category_type_id, :category_name, :parent_id
   belongs_to :store
   has_many :items
   
  searchable do
    integer :id
=begin
integer :store_id
    integer :location_id do
      store.location_id
    end

    text :item_name do
      items.collect(&:item_name).compact if items.any?
    end
    text :price do
      items.collect(&:price).compact if items.any?
    end
    text :quantity do
      items.collect(&:quantity).compact if items.any?
    end
=end

  end
=begin
def self.category_level
     @category=
   end
=end
end
