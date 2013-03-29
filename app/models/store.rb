class Store < ActiveRecord::Base
  attr_accessible :city_id, :location_id, :store_address, :store_name, :vendor_id, :longitude ,:latitude
  belongs_to :location
  #has_many :stores ,:through => :locations
  has_many :store_categories
  #has_many :items , :through=>:store_categories
  acts_as_gmappable
  def gmaps4rails_address
#describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    store_address
  end
  def gmaps4rails_infowindow
    store_address
  end

  searchable do
    integer :location_id
    text :location_name do
      location.location_name
    end
    text :item_name do
      items.collect(&:item_name).compact if items.any?
    end
  end




end
