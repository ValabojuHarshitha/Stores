class Locationdistance < ActiveRecord::Base
  attr_accessible :destination_id, :location_id, :radius
  belongs_to :location
   #has_many :stores ,:through => :locations
  searchable do
    double :radius
    integer :location_id
 #   integer :destination_id
    text :location_name do
      location.location_name
    end
    
  end

end
