class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,:role_id,:state_id, :city_id, :location_id, :address, :street
  # attr_accessible :title, :body

   def add_user_role
    create_customer if self.customer?
    create_vendor if self.vendor?
   end

   def role_name
    return 'admin' if self.role_id==1
    return 'customer' if self.role_id==2
    return 'vendor' if self.role_id==3
   end

   def admin?
    return self.role_id==1 ? true : false
   end

   def customer?
    return self.role_id==2 ? true : false
   end

   def vendor?
    return self.role_id==3 ? true : false
   end

  def create_customer
    Customer.create(:email=>self.email,:userid=>self.id)
  end

  def create_vendor
    Vendor.create(:userid=>self.id)
  end

end
