class ApplicationController < ActionController::Base
  protect_from_forgery
     before_filter :login  ,:except=>[:create,:new,:index]
   def after_sign_in_path_for(resource)
      if current_user.customer?
        current_user.add_user_role if Customer.find_by_userid(current_user.id).nil?
        customer_listing_path
      elsif current_user.vendor?
        current_user.add_user_role if Vendor.find_by_userid(current_user.id).nil?
        vendor_index_path
      else
       root_url
      end
  end

  def after_sign_out_path_for(resource)
   root_url
  end

   def store_item_list_with_radius(items,loc_id,destlist)
    final_stores_list=[]
    final_items_list=[]
    @count=0
    @items=items
    @location_id=loc_id
    @destlist=destlist
    @items.each do |i|
        store=Store.find(StoreCategory.find(i.store_category_id).store_id)
        location=Location.find(store.location_id)
        if location.id==@location_id.to_i
            @reqlocitem=i.id
            @reqlocstore=store.id
         end
        unless @destlist.blank?
             if @destlist.include?(location.id)
                final_stores_list[@count] =  store.id
                final_items_list[@count] = i.id
             end
        else
           if @location_id==location.id
              final_stores_list[@count] = store.id
              final_items_list[@count] = i.id
           end
       end
       @count = @count+1
    end

        unless @reqlocitem.blank?
          final_stores_list.insert(0,Store.find(@reqlocstore).id)
          final_items_list.insert(0,Item.find(@reqlocitem).id)
        end
      arr=(0..final_items_list.count.to_i-1)

    return final_stores_list,final_stores_list,arr
  end

protected
     def login
       if current_user.nil?
         redirect_to "http://localhost:3000/users/sign_in"
       end
     end

end
