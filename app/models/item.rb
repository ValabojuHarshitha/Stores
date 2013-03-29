class Item < ActiveRecord::Base
  attr_accessible :store_category_id, :item_description, :item_name, :price, :quantity
  has_many :storeitems
  belongs_to :store_category
  
   searchable do
    text :item_name
    text :item_description
    integer :price
#    integer :location_id do
#      store.location_id
#    end
#    double :store_id , :multiple => true , :references => Storeitem do
#      storeitems.collect(&:store_id).compact if storeitems.any?
#    end
   end
  def self.item_details(item_ids,list_name,customer_id)
    logger.info"--------------#{item_ids}-------------------"
    store_cat=Item.where("id = ?",item_ids.first.to_i).select("store_category_id").first
   store=StoreCategory.where("id = ?",store_cat.store_category_id).select("store_id").first
    #puts "#{store.store_id}-------------------store"
    #puts "#{store_cat.store_category_id}---------------cat"
    #.m.m,.m,.m,.
   list=CustomerList.create(:customer_id=>customer_id,:customer_store_id=>store.store_id,:list_name=>list_name)
    item_ids.each do |i|
      s=CustomerItem.new(:item_id=>i.to_i,:customer_list_id=>list.id)
      s.save
    end
  end
end
