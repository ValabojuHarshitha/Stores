class Location < ActiveRecord::Base
  attr_accessible :location_name, :city_id
  has_many :locationdistances
  has_many :stores
  belongs_to :city

  searchable do
  text :location_name
  integer :id
#  integer :location_id do
#    locationdistances.location_id if locationdistances=self.locationdistances
#  end
#  double :radius do
#    locationradius.radius if locationradius = self.locationradius
#   end

   double :radius , :multiple => true , :references => Locationdistance do
      locationdistances.collect(&:radius).compact if locationdistances.any?
   end
  end

  scope :user_location, lambda { |user|
    where("id = ?", user.location_id)
    #find(user.location_id)
  }
end
